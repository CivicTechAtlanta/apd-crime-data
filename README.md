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

#### How to run the shiny app
Bad news: it only runs locally right now (not yet on shinyapps.io)

Good news: it runs locally!

1. After following instructions in step 1 & 2, open this file in RStudio: shiny_app/app.R
2. There will be a play button & "Run App" in the upper right corner of the code window; click it
3. The app is kind of clunky data-wise, so be patient as it loads.  There should be pop-ups and progress bars to show it's thinking

StackOverflow question to fix problem with shiny app, so it can be deployed on the web:

* http://stackoverflow.com/questions/37367708/shiny-app-error-when-deployed-works-locally-rvest-html-nodes-issue/37381749#37381749
