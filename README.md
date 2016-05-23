#### Overview
Convert [Atlanta Police Department's "Crime Data Downloads" site ](http://www.atlantapd.org/crimedatadownloads.aspx) into tidy format, using R

#### How to work with this data
   1. Clone this repo to your computer
   2. Set it as your working directory in R
   3. Run the following code in R:
    * ```source("R/get_clean_data.R")```
    * ```source("R/map_data.R")```
    * ```source("R/create_map.R")```
   4. This will output the following files:
    * data/APD_crime.csv: cleaned data
    * data/COBRAmmddyy.csv: raw data from APD site
    * zone_shapefiles/[Shape files]

#### Shiny App Notes
    This repo contains a shiny_app folder, which is a self-contained app that runs locally.  The deployed web app is still in development (see link below to issue on stackoverflow).
	    * http://stackoverflow.com/questions/37367708/shiny-app-error-when-deployed-works-locally-rvest-html-nodes-issue/37381749#37381749