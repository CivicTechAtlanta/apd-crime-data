# Get and clean Atlanta Police Department Data

# ---- FUNCTION: GETTING DATA FROM APD ----
get.apd.data <- function(selector.text, save.location){
     require(rvest)
     require(dplyr)
     temp <- tempfile()
     download.file(
          read_html("http://www.atlantapd.org/crimedatadownloads.aspx") %>% 
               html_nodes(selector.text) %>% 
               html_attr("href") %>% 
               paste0("http://www.atlantapd.org/", .),
          destfile = temp)
     # Save filename of csv crime data raw file, for later use
     crime.data.filename <- unzip(temp, list = TRUE)$Name
     # Unzip crime data to "data" folder and close temp file placeholder
     unzip(temp, exdir = save.location)
     unlink(temp)
     crime.data.filename
}

# ---- GET & CLEAN CRIME DATA -----
# (crime data published weekly as zip file on
# http://www.atlantapd.org/crimedatadownloads.aspx)
get.apd.crime.data <- function(download.file.flag = TRUE){
     require(lubridate)
     require(dplyr)
     require(readr)

     if(download.file.flag | length(grep("COBRA", list.files("data"))) == 0){
          crime.data.filename <- get.apd.data(
               selector.text = "tr:nth-child(15) a", save.location = "./data")
     }

     if(!download.file.flag){
          # Of the files in the "data" folder containing "COBRA", pick the last one
          # (this is essentially getting the most recent copy of the COBRA csv file)
          crime.data.filename <- list.files("data")[max(grep("COBRA", 
                                                             list.files("data")))]
     }

     # Read csv file of crime data
     apd.crime.raw <- read_csv(paste0("data/",crime.data.filename), col_names = TRUE, 
                               col_types = cols(occur_time = "c", poss_time = "c"),
                               na = c("", "NA", "NULL"))
     
     # Kick out problem rows to their own data frame
     apd.crime.problems <- problems(apd.crime.raw)$row
     
     # Filter out problem rows
     apd.crime <- apd.crime.raw %>% slice(-apd.crime.problems)
     
     # Remove space from "UC2 Literal" column name
     names(apd.crime)[grep("UC2", names(apd.crime))] <- "UC2_Literal"
     
     # Convert character-formatted date/time columns to POSIXct 
     apd.crime <- apd.crime %>% 
          mutate(occur_date = mdy(occur_date),
          occur_time = hms(occur_time),
          occur_hour = hour(occur_time),
          poss_date = mdy(poss_date), rpt_date = mdy(rpt_date), 
          reported_year = year(rpt_date))
     
     write_csv(apd.crime, "data/APD_crime.csv")
     
     return(list(apd.crime = apd.crime,
                 apd.crime.problems = problems(apd.crime.raw)))
}