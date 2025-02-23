# Data Cleaning Script: data_cleaning.R
# Author: MAHESHWAR VANGAPATY
# Date: 2024-04-27

# Load required libraries
library(dplyr)
library(tidyr)

# Load dataset
data <- read.csv("Life Expectancy Data.csv")

# Remove extra spaces in column names
names(data) <- gsub("\\s+", "", names(data))

# Selecting relevant variables (excluding categorical and redundant ones)
selected_data <- data[, !(names(data) %in% c("Country", "Year", "Population"))]

# Checking structure of selected data
str(selected_data)

# Handling Missing Values
missing_values <- sapply(selected_data, function(x) sum(is.na(x)))
print(missing_values)

# Removing rows with missing values
selected_data1 <- na.omit(selected_data)

# Verifying missing values after removal
missing_values_after <- sapply(selected_data1, function(x) sum(is.na(x)))
print(missing_values_after)

# Save cleaned dataset
write.csv(selected_data1, "cleaned_life_expectancy_data.csv", row.names = FALSE)

# End of script