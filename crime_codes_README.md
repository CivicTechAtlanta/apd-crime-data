# Notes on crime_codes.txt

#### Information source
1. Copy + Pasted text from "UCR and GCIC Classifications and Codes" on page 6-16 (as marked on document footer) from PDF file
http://www.atlantapd.org/pdf/crime-data-downloads/28.pdf
2. Commas were removed as shown in table below
3. Added commas manually as field delimiters, using PDF file as reference

#### Removing commas from within fields
In order to work with the crime_codes.txt as a comma-delimited file, some replacements to data in fields were needed

|ORIGINAL TEXT                                |CHANGED TO                                 |
|---------------------------------------------|-------------------------------------------|
|HANDS, FISTS, FEET                           |HANDS FISTS FEET                           |
|TRUCKS, BUSES, AND VANS                      |TRUCKS BUSES AND VANS                      |
|Thefts of Service, Conversion by Lease, etc. |Thefts of Service Conversion by Lease etc. |