install.packages('tidyverse',dependency=T)
install.packages("ggplot2", dependency=T)

file.exists("C:/Users/Gibby/Downloads/Data Science/DataScienceProject/state_of_idaho.csv")

data <- read.csv("C:/Users/Gibby/Downloads/Data Science/DataScienceProject/state_of_idaho.csv", skip = 196)

str(data)

summary(data)

data$Date <- as.Date(data$Date, format = "%b %Y")
stations <- unique(data$`Station Name`)