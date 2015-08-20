## APD_calculatedcols.R

## This script works with the output of www.github.com/codeforatlanta/apd-crime-data/getdata_APD_crime.R
## named "COBRA_cleaned.csv"

library(dplyr)
library(lubridate)

# apd.cleandata columns:
#   "MI_PRINX","offense_id","rpt_date","occur_date","occur_time",
#   "poss_date","poss_time","beat","apt_office_prefix","apt_office_num",
#   "location","MinOfucr","MinOfibr_code","dispo_code",
#   "MaxOfnum_victims","Shift","Avg.Day","loc_type","UC2.Literal",
#   "neighborhood","npu","x","y"

apd.cleandata <- read.csv("COBRA_cleaned.csv",stringsAsFactors = FALSE)

# avg_datetime = Average of occur date+time & possible date+time
occur_datetime <- mdy(apd.cleandata$occur_date) + hms(apd.cleandata$occur_time)
poss_datetime <- mdy(apd.cleandata$poss_date) + hms(apd.cleandata$poss_time)
avg_datetime <- occur_datetime + (poss_datetime - occur_datetime)/2

# other time-based attribute columns
avg_year <- year(avg_datetime)
avg_quarter <- quarter(avg_datetime)
avg_month <- month(avg_datetime)
avg_week <- week(avg_datetime)
avg_day.of.year <- yday(avg_datetime)
avg_day.of.month <- mday(avg_datetime)
avg_day.of.week <- wday(avg_datetime)
