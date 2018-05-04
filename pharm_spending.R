# Import R packages
install.packages("ggplot2") # ggplot2
install.packages("dplyr") # dplyr

# Load R packages
library("ggplot2")
library("dplyr")

# Load spending_data.csv
mydata = read.csv('spending_data.csv', head = TRUE, sep = ",", fileEncoding="UTF-8-BOM")

# Extract records from 2015
year = mydata$TIME # extract year column from mydata
year_index = which(year == 2015) # find rows where year is 2015
mydata_2015 = mydata[year_index,] # extract records from 2015 into data set

# Extract records for per capita spending
percap = mydata_2015$MEASURE # extract measure column from mydata_2015
percap_index = which(percap == "USD_CAP") # find rows where measure is per capita
mydata_2015pc = mydata_2015[percap_index,] # extract per capita records into data set

# Extract all pc
all = mydata$MEASURE
all_index = which(all == "USD_CAP")
mydata_all = mydata[all_index,]

year2013 = mydata$TIME # extract year column from mydata
year2013_index = which(year == 2013) # find rows where year is 2015
mydata_2013 = mydata[year2013_index,] # extract records from 2015 into data set

percap2013 = mydata_2013$MEASURE # extract measure column from mydata_2015
percap2013_index = which(percap2013 == "USD_CAP") # find rows where measure is per capita
mydata_2013pc = mydata_2013[percap2013_index,] # extract per capita records into data set


# Set up data set for bar plot
mydata_plot2015 = mydata_2015pc %>%
  select(LOCATION, Value)

# Create bar plot
p = ggplot(data = mydata_plot2015, aes(x = reorder(LOCATION, Value), y = Value)) + 
  geom_bar(stat = "identity", fill = "steelblue", width = 0.75, color = "black") + 
  xlab("Country") + 
  ylab("USD per Capita") +
  labs(title = "Per Capita Spending on Prescription Pharmaceuticals in 2015") +
  coord_flip()
p

# Set up data set for bar plot
mydata_plot2013 = mydata_2013pc %>%
  select(LOCATION, Value)


pd = ggplot(data = mydata_plot2013, aes(x = reorder(LOCATION, Value), y = Value)) + 
  geom_bar(stat = "identity", fill = "steelblue", width = 0.75, color = "black") + 
  xlab("Country") + 
  ylab("USD per Capita") +
  labs(title = "Per Capita Spending on Prescription Pharmaceuticals in 2013") +
  coord_flip()
pd
# Extract all values besides the United States
values = mydata_plot$Value # create list of values
values = values[-26] # remove USA data from list
mean(values) # find mean of values 

# Create readable country name table
names2015 = c("Austria", "Belgium", "Canada", "Czech Republic", "Denmark", "Finland", "France", "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Italy", "Korea", "Luxembourg", "Mexico", "Netherlands", "Norway", "Poland", "Portugal", "Slovakia", "Spain", "Sweden", "Switzerland", "United Kingdom", "United States", "Estonia", "Slovenia", "Latvia", "Lituania", "Russia") # list of readable names

names2013 = c("Australia", "Austria", "Belgium", "Canada", "Czech Republic", "Denmark", "Finland", "France", "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Italy", "Japan", "Korea", "Luxembourg", "Mexico", "Netherlands", "Norway", "Poland", "Portugal", "Slovakia", "Spain", "Sweden", "Switzerland", "United Kingdom", "United States", "Estonia", "Israel", "Slovenia", "Latvia", "Lithuania")

mydata_plot2013$LOCATION = names2013 # replace column in R with names

mydata_plot2015$LOCATION = names2015 # replace column in R with names

# Adapt to paper list
modelvalues = values[-c(9, 10, 12, 13, 16, 17, 18, 20, 21, 24, 25, 29, 31)]

mean(modelvalues) # find mean of model names

values2015 = mydata_plot2015$Value # create list of values from 2015
values2015 = values2015[-26] # remove USA data from list
mean(values2015) # find mean of values 

values2013 = mydata_plot2013$Value # create list of values from 2013
values2013 = values2013[-28] # remove USA data from list
mean(values2013) # find the mean of values


# Create box plot
fmydata_plot = as.factor(mydata_2015pc$Value)
b = ggplot(mydata_2015pc, aes(x = MEASURE, y = Value)) +
  geom_boxplot(width = 0.25) + 
  xlab("") + 
  ylab("USD per Capita") +
  labs(title = "Distribution of Per Capita Spending on Prescription Pharmaceuticals in 2015")
b

fmydata_plot = as.factor(mydata_2013pc$Value)
c = ggplot(mydata_2013pc, aes(x = MEASURE, y = Value)) +
  geom_boxplot(width = 0.25) + 
  xlab("") + 
  ylab("USD per Capita") +
  labs(title = "Distribution of Per Capita Spending on Prescription Pharmaceuticals in 2013")
