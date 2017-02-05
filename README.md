#### Overview
Code for automatically downloading data from [Atlanta Police Department's "Crime Data Downloads" site ](http://http://www.atlantapd.org/i-want-to/crime-data-downloads)

#### Notes
The data download process is documented in the R Markdown file [/apd-crime-data.Rmd](/apd-crime-data.Rmd).  This file is an "R Notebook" (similar to a Python Notebook), and optimized for use in RStudio, version 1.0 and later

#### Next Steps
* Work with APD to regularly publish this data into a true open data portal (like Socrata) for easy access
* Set up scheduling to detect when new data uploaded onto the APD site, and automatically post into the above mentioned open data portal

Following the above steps will make this data much easier to access for other transparency / open data projects, e.g. [Data For Democracy's "USA Dashboard"](https://github.com/Data4Democracy/usa-dashboard)

#### Reference Info
   * UCR Codes
      * [ATL PD "UCR Code Sheet" (pdf)](http://www.atlantapd.org/pdf/crime-data-downloads/28.pdf)
      * **crime_codes.txt** Data copied + pasted from the above linked pdf
