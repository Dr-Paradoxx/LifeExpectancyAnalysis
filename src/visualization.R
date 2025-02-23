# Visualization Script: visualization.R
# Author: MAHESHWAR VANGAPATY
# Date: 2024-04-27

# Load required libraries
library(ggplot2)
library(reshape2)

# Load processed dataset
selected_data1 <- read.csv("processed_life_expectancy_data.csv")

# Scatter plot: Life Expectancy vs. GDP
ggplot(selected_data1, aes(x = GDP, y = Life.expectancy)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  ggtitle("Scatter Plot of Life Expectancy vs. GDP") +
  xlab("GDP") + ylab("Life Expectancy")

# Scatter plot: Life Expectancy vs. Schooling
ggplot(selected_data1, aes(x = Schooling, y = Life.expectancy)) +
  geom_point(alpha = 0.5, color = "green") +
  geom_smooth(method = "lm", se = FALSE, color = "darkgreen") +
  ggtitle("Scatter Plot of Life Expectancy vs. Schooling") +
  xlab("Schooling") + ylab("Life Expectancy")

# Boxplot: Life Expectancy by Country Status
ggplot(selected_data1, aes(x = Status, y = Life.expectancy, fill = Status)) +
  geom_boxplot() +
  ggtitle("Life Expectancy by Country Status") +
  xlab("Status") + ylab("Life Expectancy")

# Histogram for Alcohol Consumption
ggplot(selected_data1, aes(x = Alcohol)) +
  geom_histogram(bins = 20, fill = "purple", color = "white") +
  ggtitle("Histogram of Alcohol Consumption") +
  xlab("Alcohol Consumption per capita") + ylab("Frequency")

# Faceted Scatter plot: Life Expectancy vs. BMI, separated by Status
ggplot(selected_data1, aes(x = BMI, y = Life.expectancy)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~Status) +
  ggtitle("Life Expectancy vs. BMI by Country Status") +
  xlab("BMI") + ylab("Life Expectancy") + theme_minimal()

# Correlation Heatmap
cor_matrix <- cor(selected_data1[, sapply(selected_data1, is.numeric)], use = "complete.obs")
melted_cor_matrix <- melt(cor_matrix)

ggplot(melted_cor_matrix, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  geom_text(aes(label = sprintf("%.2f", value)), color = "black", size = 3) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.text.y = element_text(angle = 0, hjust = 1)) +
  ggtitle("Correlation Heatmap")

# Save all plots as PNG files
ggsave("scatter_gdp_vs_life_expectancy.png")
ggsave("scatter_schooling_vs_life_expectancy.png")
ggsave("boxplot_life_expectancy_status.png")
ggsave("histogram_alcohol.png")
ggsave("faceted_scatter_bmi_vs_life_expectancy.png")
ggsave("correlation_heatmap.png")

# End of script