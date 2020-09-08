#loading the libraries I'll use
library(tidyverse)
library(readxl)

#Loading my data set and reviewing:
accidents_ke <- read_excel("C:/Users/Admin/Desktop/MY.123/Data Sets/kenya-accidents-database.xlsx")
accidents_ke

#Getting a brief summary of the data set 
glimpse(accidents_ke)

#Dropping the columns I won't need:
droped <- accidents_ke %>% select( -NO., -...13)
droped


#Getting a list of the column names
colnames(droped)


#Changing column names:
#(1) Using actual names
droped <- droped %>% rename(TIME ="TIME 24 HOURS")
droped <- droped %>% rename (BASES = "BASE/SUB BASE")

#(2) Using column index
names(droped)[6] <- "DETAILS"
names(droped)[11] <- "YR-MM-DD"

#Confirming that the names changed
colnames(droped)


#Dropping duplicates observations from the data set
droped %>% distinct(TIME, PLACE, .keep_all = TRUE)


