# Install required packages 
#install.packages(c("readxl", "ggplot2", "dplyr", "tidyverse", "ggpubr", "DescTools", "car"))

# Load necessary libraries
library(readxl)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(ggpubr)
library(car)
library(DescTools)

# Read Excel file (update file path as needed)
data <- read_csv("AB-Testing-on-Web-Analytics-Data/Data Files/marketing_AB.csv")  # Adjust sheet name if necessary

# View dataset structure
glimpse(data)

# Check for missing values
colSums(is.na(data))

## Data Pre-processing
# Drop unnecessary columns
data <- data %>% select(-c(`...1`, `user id`))

# Rename columns for better readability
colnames(data) <- c("test_group", "total_ads", "most_ads_day", "most_ads_hour", "converted")

# Convert categorical variables to factors
data$test_group <- as.factor(data$test_group)
data$most_ads_day <- as.factor(data$most_ads_day)
data$most_ads_hour <- as.factor(data$most_ads_hour)

# Convert 'converted' to numeric (0 or 1)
data$converted <- as.numeric(data$converted)

# Summary statistics
summary(data)

## EDA
# Count test group occurrences
table(data$test_group)

# Conversion rates by test group
conversion_rates <- data %>%
  group_by(test_group) %>%
  summarise(conversion_rate = mean(converted))
print(conversion_rates)

# Histograms
data$total_ads <- as.numeric(data$total_ads)

ggplot(data, aes(x = total_ads)) + 
  geom_histogram(binwidth = 50, fill = "blue", alpha = 0.7) + 
  ggtitle("Distribution of Total Ads") + 
  theme_minimal()

ggplot(data, aes(x = converted, fill = test_group)) + 
  geom_bar(position = "dodge") + 
  ggtitle("Conversion Counts by Test Group") + 
  theme_minimal()


