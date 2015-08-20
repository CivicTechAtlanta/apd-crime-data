# Get data from http://www.atlantapd.org/crimedatadownloads.aspx
# Code Sheet: http://www.atlantapd.org/pdf/crime-data-downloads/28.pdf

# The raw data file is updated regularly, so the filename changes
# Download the "Crime Data File Raw Data" zip file, and unzip to the working directory
# and rename as "APD_crime.csv"

library(dplyr)
library(lubridate)

# Get data and clean up columns
crime_colclasses <- c(rep("numeric",times=2), rep("character",times=21))
crime <- as_data_frame(read.csv("APD_crime.csv", na.strings="NULL", stringsAsFactors=FALSE))
crime$MI_PRINX <- as.numeric(crime$MI_PRINX)

# Remove summary note from last row
# crime <- crime[1:length(crime$offense_id)-1,]

# List of offense_id of rows found with errors upon manual inspection
error_by_offense_id <- c(91350923, 91420511, 91471067, 91521689, 101540909, 
                        101701138, 111971638, 112090917, 112411694, 113130827, 
                        113221244, 113270554, 113531411, 113590628, 120230979, 
                        122561142, 130101490, 141621526, 142570818, 151362710)

# Create new data frame of non-error rows, with extra columns X, X.1, X.2 removed
crime2 <- filter(crime, !(offense_id %in% error_by_offense_id)) %>%
  select(-c(X,X.1,X.2))
write.csv(crime2, "COBRA_cleaned.csv", row.names=FALSE")

# Create new data frame of error rows only, and write to csv file
error_rows <- filter(crime, offense_id %in% error_by_offense_id)
write.csv(error_rows, "COBRA_error_rows.csv", row.names=FALSE)