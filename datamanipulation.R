#removing all things from memory:
rm(list =ls())

#load the libraries
library(tidyverse)
library(lubridate)
library(readxl)

#set working directory
setwd("/Users/Admin/Desktop/MY.123/Data Sets")

df1 <- read_excel("/Users/Admin/Desktop/MY.123/Data Sets/kenya-accidents-database.xlsx", sheet =1)
df2 <- read_excel("/Users/Admin/Desktop/MY.123/Data Sets/kenya-accidents-database.xlsx", sheet =2)

appended_df <- bind_rows(df1, df2,.id= "dfs") 

#extracting diff components from a date variale:

appended_df <- appended_df %>%
  rename(date_variable = 'Date DD/MM/YYYY')%>%
  ##Extract year
  mutate(yr = year(date_variable))%>%
  ##extract the month
  mutate(month = month(date_variable))%>%
  ##extract the month but with the full label
  mutate(month_with_label = month(date_variable, label = TRUE,abbr = FALSE))%>%
  ##Extract the day
  mutate(day_var = date(date_variable)) 

summ <- appended_df %>%
  group_by(month_with_label)%>%
  summarise(total_count = n())