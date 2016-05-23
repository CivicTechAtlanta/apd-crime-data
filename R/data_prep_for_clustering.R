# Create matrix of numeric values representing data in APD_Crime dataset
mydata <- apd.crime %>% 
     select(occur_date, occur_time, beat, MinOfucr, 
            MinOfibr_code, dispo_code, MaxOfnum_victims, 
            loc_type, `UC2 Literal`, neighborhood) %>%
     mutate(occur_date = as.numeric(mdy(occur_date)), occur_time = as.numeric(hms(occur_time)),
            beat = as.numeric(as.factor(beat)), MinOfucr = as.numeric(as.factor(MinOfucr)),
            MinOfibr_code = as.numeric(as.factor(MinOfibr_code)), 
            dispo_code = as.numeric(as.factor(dispo_code)),
            UC2_Literal = as.numeric(as.factor(`UC2 Literal`)),
            neighborhood = as.numeric(as.factor(neighborhood))) %>%
     select(-`UC2 Literal`) %>%
     as.matrix()

# Save factor levels for reference (since converting data to matrix)
beat.levels <- levels(as.factor(apd.crime$beat))
MinOfucr.levels <- levels(as.factor(apd.crime$MinOfucr))
MinOfibr_code.levels <- levels(as.factor(apd.crime$MinOfibr_code))
dispo_code.levels <- levels(as.factor(apd.crime$dispo_code))
UC2_Literal.levels <- levels(as.factor(apd.crime$UC2_Literal))
neighborhood.levels <- levels(as.factor(apd.crime$neighborhood))

# Prepare Data
mydata <- na.omit(mydata) # listwise deletion of missing
mydata <- scale(mydata) # standardize variables

# Perform Clustering
# The dist(...) code below is very computationally expensive with a dataset
# of 200,000 rows; need to take another approach
#d <- dist(mydata, method = "euclidean") # distance matrix
#fit <- hclust(d, method="ward.D") 
#plot(fit) # display dendogram
#groups <- cutree(fit, k=5) # cut tree into 5 clusters

# draw dendogram with red borders around the 5 clusters 
#rect.hclust(fit, k=5, border="red")