#install necessary libraries
install.packages('tidyverse',dependency=T)
install.packages("ggplot2", dependency=T)
library(ggplot2)
library(tidyverse)

#check if file exists
file.exists("C:/Users/Gibby/Downloads/Data Science/DataScienceProject/state_of_idaho.csv")

#load csv file and ignore the header
data <- read.csv("C:/Users/Gibby/Downloads/Data Science/DataScienceProject/state_of_idaho.csv", skip = 196)

#if the date column exists, convert it to a date object
data$Date <- as.Date(paste("01", data$Date), format="%d %b %Y")

#create a year-month column for easier grouping
data$Date <- format(data$Date, "%Y-%m")

#print structure
str(data)

#get summary of data
summary(data)

#ensure the columns  and Air.Temperature.Average..degF. &  Snow.Water.Equivalent..in..Start.of.Month.Values are numeric
data$Air.Temperature.Average..degF. <- as.numeric(data$Air.Temperature.Average..degF.)
data$Snow.Water.Equivalent..in..Start.of.Month.Values <- as.numeric(data$Snow.Water.Equivalent..in..Start.of.Month.Values)

#create a scatterplot with beest fit line
ggplot(data, aes(x = Air.Temperature.Average..degF., y = Snow.Water.Equivalent..in..Start.of.Month.Values)) +
	geom_point(color = "red", size = 1)+
  	geom_smooth(method = "lm", color = "blue", se = FALSE)+   	
	labs(
    		title = "Scatterplot of Air Temperature vs Snow Water Equivalent",
    		x = "Average Air Temperature (°F)",
    		y = "Snow Water Equivalent (in)"
  	)+
  	theme_minimal()


#save the data frame
saveRDS(data, file="C:/Users/Gibby/Downloads/Data Science/DataScienceProject/DataFrame.Rda")
