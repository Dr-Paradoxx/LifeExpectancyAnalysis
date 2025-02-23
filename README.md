# LifeExpectancyAnalysis

## Overview
This project analyzes global life expectancy determinants using statistical models in R. The study examines the impact of health indicators, socioeconomic factors, and education on life expectancy.

## Dataset
The dataset is sourced from Kaggle: [Life Expectancy - WHO](https://www.kaggle.com/datasets/kumarajarshi/life-expectancy-who). It covers health metrics for 193 countries from 2000 to 2015.

## Research Questions
1. What are the primary health indicators and socio-economic factors influencing life expectancy?
2. How does education impact life expectancy when controlling for economic status and health indicators?

## Methodology
- **Data Cleaning:** Removing missing values, handling outliers.
- **Exploratory Data Analysis:** Visualizing data distribution, correlations.
- **Statistical Modeling:** Implementing multiple linear regression models to identify significant predictors.
- **Model Diagnostics:** Assessing assumptions of normality, multicollinearity, and residuals.

## Key Findings
- Education level positively correlates with increased life expectancy.
- Economic growth (GDP per capita) and health expenditure significantly impact life expectancy.
- High prevalence of HIV/AIDS negatively affects life expectancy.

## File Structure
- `data/` - Contains the dataset.
- `src/` - R scripts for data preprocessing, analysis, and visualization.
- `reports/` - Proposal and Final project report & presentation.
- `notebooks/` - RMarkdown files for in-depth analysis.

## How to Run
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/LifeExpectancyAnalysis.git
   
2.	Install required R packages:
    ```sh
    install.packages(c("ggplot2", "dplyr", "corrplot", "caret"))

3.	Run the analysis:
   ```sh
   source("src/analysis.R")
