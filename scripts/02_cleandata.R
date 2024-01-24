#### Preamble ####
# Purpose: Clean  reported crime data
# Author: Kelly Lyu
# Date: 24 January 2024
# Contact: kelly.lyu@mail.utoronto.ca
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(knitr) # For creating table
library(janitor) # For cleaning data

# Select the necessary columns from the dataset
cleaned_data <- select(resources, DIVISION, SUBTYPE, REPORT_YEAR, COUNT_CLEARED, 
                       COUNT_)

# Remove rows with missing values
cleaned_data <- drop_na(cleaned_data)

# Add a new column 'rate_of_cleared_crime' which is the ratio of 'COUNT_CLEARED' to 'COUNT_'
# and ensuring 'COUNT_CLEARED' and 'COUNT_' are numeric before the division
cleaned_data <- mutate(cleaned_data, 
                       clearance_rate = as.numeric(COUNT_CLEARED) / as.numeric(COUNT_))

# Convert 'clearance_rate' column to integer type for cleaner data representation
cleaned_data$clearance_rate <- as.integer(cleaned_data$clearance_rate)

# Add a new column 'unsolved crime' which is the difference value between 'COUNT_CLEARED' and 'COUNT_'
# and ensuring 'COUNT_CLEARED' and 'COUNT_' are numeric before the division
cleaned_data <- mutate(cleaned_data,
                       unsolved_crime = as.numeric(COUNT_) - as.numeric(COUNT_CLEARED))

# Convert 'unsolved_crime' column to integer type for cleaner data representation
cleaned_data$unsolved_crime <- as.integer(cleaned_data$unsolved_crime)

# Standardize column names to lowercase for consistency
colnames(cleaned_data) <- tolower(colnames(cleaned_data))

# Summarize the 'clearance_rate'  by year
yearly_summary <- cleaned_data %>%
  group_by(report_year) %>%
  summarise(
    Total = sum(clearance_rate, na.rm = TRUE),
    Mean = mean(clearance_rate, na.rm = TRUE))

# Viewing the yearly summary table
kable(yearly_summary, caption = "Yearly Summary of Clearance Rates")

# Save cleaned data
write_csv(x = cleaned_data, file = "Cleaned_Reported_Crime.csv")

# Display the head of the cleaned data
head(cleaned_data)


