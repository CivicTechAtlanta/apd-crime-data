#### Overview
Convert [Atlanta Police Department's "Crime Data Downloads" site ](http://www.atlantapd.org/crimedatadownloads.aspx) into tidy format, using R

#### How to get data
   1. Download raw data file & unzip the csv contents into your working directory
   2. Rename the csv as **APD_crime.csv**
   2. Save **getdata_APD_crime.R** to your working directory
   3. Run the following in the R command line:
    * ```source('./getdata_APD_crime.R')```
    * ```getdata()```
   4. This will output 2 files in the working directory:
    * **COBRA_cleaned.csv**:  non-error rows, with extra columns X, X.1, X.2 removed
    * **COBRA_errors.csv**: error rows only
