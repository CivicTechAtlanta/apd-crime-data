## This script is self-contained code that will generate a shiny app if run
## on your local RStudio instance.  I'm (bbrewington) working on debugging a deployed
## version to shinyapps.io to display on the web

# Load packages
library(shiny); library(lubridate); library(ggplot2)
library(ggmap); library(RgoogleMaps); library(readr)
library(rvest); library(dplyr)
#source("https://raw.githubusercontent.com/codeforatlanta/apd-crime-data/new-data-flow/R/get_clean_data.R")
#source("https://raw.githubusercontent.com/codeforatlanta/apd-crime-data/new-data-flow/R/map_data.R")

# Get crime data
apd.crime <- get.apd.crime.data(download.file.flag = FALSE)$apd.crime

# Get map object
AtlantaMap <- create.atlanta.map() #can customize this call depending on ui values; would
                                   #need to place in ui chunk

ui <- fluidPage(
     titlePanel("Atlanta Crime Data Explorer"),
     sidebarLayout(
          sidebarPanel(
              sliderInput("year", "Report Year", value = 2016,
                           min = 2009, max = year(today())),
              checkboxInput("crime.category.homicide", "Plot Homicide Only", value = TRUE),
              checkboxInput("map.show.zones", "Show APD Zones", value = FALSE)
          ),
          mainPanel(
               plotOutput('plot')
          )
     )
)

server <- function(input, output) {
     
     dataset <- reactive({
          if(input$crime.category.homicide){
               apd.crime %>% filter(report.year == input$year & UC2_Literal == "HOMICIDE")
          } else {
               apd.crime %>% filter(report.year == input$year)
          }
     })
     
     output$plot <- renderPlot({
          
          p <- AtlantaMap + 
               ggtitle(paste0("Atlanta Crime in ", input$year)) +
               geom_density2d(data = dataset(), aes(x, y)) + 
               facet_wrap(~UC2_Literal)
          if(input$crime.category.homicide){
               p <- p + geom_point(data = dataset(), aes(x, y)) +
                    ggtitle(paste0("Atlanta Homicides in ", input$year, ": ", 
                                   dataset() %>% summarise(n()) %>% as.numeric()))
          }
          if(input$map.show.zones){
               p <- p + add.zones()
          }
          
          print(p)
          
     }, height=800)
     
}

shinyApp(ui = ui, server = server)