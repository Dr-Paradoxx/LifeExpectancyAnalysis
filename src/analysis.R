# Analysis Script: analysis.R
# Author: MAHESHWAR VANGAPATY
# Date: 2024-04-27

# Load required libraries
library(dplyr)
library(ggplot2)
library(car)
library(lmtest)
library(MASS)
library(broom)

# Load cleaned dataset
selected_data1 <- read.csv("cleaned_life_expectancy_data.csv")

# Outlier Detection Function
count_outliers <- function(x) {
  qnt <- quantile(x, probs = c(.25, .75), na.rm = TRUE)
  iqr <- IQR(x, na.rm = TRUE)
  lower <- qnt[1] - 1.5 * iqr
  upper <- qnt[2] + 1.5 * iqr
  return(sum(x < lower | x > upper, na.rm = TRUE))
}

# Count outliers in numeric columns
outlier_counts <- sapply(selected_data1[, sapply(selected_data1, is.numeric)], count_outliers)
print(outlier_counts)

# Define and apply capping function to treat outliers
cap_outliers <- function(x) {
  qnt <- quantile(x, probs = c(0.25, 0.75), na.rm = TRUE)
  iqr <- IQR(x, na.rm = TRUE)
  lower <- qnt[1] - 1.5 * iqr
  upper <- qnt[2] + 1.5 * iqr
  x[x < lower] <- lower
  x[x > upper] <- upper
  return(x)
}

numeric_cols <- sapply(selected_data1, is.numeric)
selected_data1[, numeric_cols] <- lapply(selected_data1[, numeric_cols], cap_outliers)

# Normality Check using QQ plots
par(mfrow=c(3, 3))
for (col in names(selected_data1)[numeric_cols]) {
  qqnorm(selected_data1[[col]], main=col, col="blue")
  qqline(selected_data1[[col]], col="red")
}
par(mfrow=c(1, 1))

# Save cleaned and processed data
write.csv(selected_data1, "processed_life_expectancy_data.csv", row.names = FALSE)

# Build Multiple Linear Regression Model
full_model <- lm(Life.expectancy ~ ., data = selected_data1)
summary(full_model)

# Model Refinement - Selecting only significant predictors
significant_model <- lm(Life.expectancy ~ Status + Adult.Mortality + infant.deaths + 
                          percentage.expenditure + Hepatitis.B + under.five.deaths +
                          Diphtheria + HIV.AIDS + Income.composition.of.resources +
                          thinness.5.9.years + Schooling, data = selected_data1)
summary(significant_model)

# Save model for future use
saveRDS(significant_model, "life_expectancy_model.rds")

# End of script