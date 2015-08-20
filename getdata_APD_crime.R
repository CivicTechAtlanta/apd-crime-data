# Get data from http://www.atlantapd.org/crimedatadownloads.aspx
# Code Sheet: http://www.atlantapd.org/pdf/crime-data-downloads/28.pdf

# The raw data file is updated regularly, so the filename changes
# Download the "Crime Data File Raw Data" zip file, and unzip the contents
# to the working directory, named as "APD_crime.csv"

library(dplyr)

getdata <- function(){
  # Get data and clean up columns
  rawdata_colclasses <- c(rep("numeric",times=2), rep("character",times=21))
  rawdata <- as_data_frame(read.csv("APD_crime.csv", na.strings="NULL", stringsAsFactors=FALSE))
  rawdata$MI_PRINX <- as.numeric(rawdata$MI_PRINX)
  
  # Lists of errors by offense_id
  errors_horiz_offset <- c(91350923, 91420511, 91471067, 91521689, 101540909, 
                           101701138, 111971638, 112090917, 112411694, 113130827, 
                           113221244, 113270554, 113531411, 113590628, 120230979, 
                           122561142, 130101490, 141621526, 142570818, 151362710)
  errors_strange_date <- c(141260924)
  errors_all <- c(errors_horiz_offset, errors_strange_date)
  
  # Create new data frame of non-error rows, with extra columns X, X.1, X.2 removed
  apd.cleandata <- filter(rawdata, !(offense_id %in% errors_all)) %>%
    select(-c(X,X.1,X.2))
  write.csv(apd.cleandata, "COBRA_cleaned.csv", row.names=FALSE)
  
  # Create new data frame of error rows only, and write to csv file
  error_rows <- filter(rawdata, offense_id %in% errors_all)
  write.csv(error_rows, "COBRA_errors.csv", row.names=FALSE)
  
  # Return clean data
  apd.cleandata
}
