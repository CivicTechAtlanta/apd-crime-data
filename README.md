#### Overview
Convert [Atlanta Police Department's "Crime Data Downloads" site ](http://www.atlantapd.org/crimedatadownloads.aspx) into tidy format, using R

#### How to get data
   1. Clone this repo to your computer
   2. Set it as your working directory in R
   3. Run the following code in R:
    * ```source("R/get_clean_data")```
    * ```source("R/map_data")```
   4. This will output files in the data folder:
    * APD_crime.csv: cleaned data
	* COBRAmmddyyyy.csv: raw data from APD site
   5. Step 3 will also make these functions available:
    * get.apd.data: function used in next step
	* get.apd.crime.data: gets data, writes to csv, and outputs a list of 2 elements:
	    * apd.crime: data frame of cleaned data (identical to APD_crime.csv)
		* apd.crime.problems: data created by readr function read_csv when data was read into R.  Essentially a data frame showing the junk data
	* create.atlanta.map: Creates a ggmap object of Atlanta
	* add.zones: Layer of APD zones for map
	
#### Shiny App Notes
    This repo contains a shiny_app folder, which is a self-contained app that runs locally.  The deployed web app is still in development (see link below to issue on stackoverflow).
	    * http://stackoverflow.com/questions/37367708/shiny-app-error-when-deployed-works-locally-rvest-html-nodes-issue/37381749#37381749