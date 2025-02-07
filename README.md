# A/B Testing on Ad Campaign

## Author  
**Balaji Adithya Dhandapani Shanmugasundaram**  

## Date  
**Feb 07, 2025**  

## Overview  
This project analyzes an A/B test conducted on an advertising campaign to assess the impact of advertisements on user conversion rates. The dataset consists of users who were either exposed to advertisements or public service announcements (PSAs). The primary objective is to determine whether advertisements lead to a significant increase in conversions compared to PSAs.  
[Dataset Link](https://www.kaggle.com/datasets/faviovaz/marketing-ab-testing/data)

Additionally, the study examines the influence of key factors such as:  
- The day of the week when the maximum number of ads were displayed  
- The hour of the day when the most ads were viewed  
- The total number of ads seen by users  
- Interaction effects between these factors  

Statistical techniques, including Chi-Square tests, ANOVA, and Two-Proportion Z-Tests, are applied, along with machine learning approaches such as Random Forest, to analyze the dataset.

---

## Data Preprocessing  

### Data Cleaning and Transformation  
- Unnecessary columns such as `user id` were removed.  
- Column names were renamed for clarity.  
- Categorical variables (`test_group`, `most_ads_day`, `most_ads_hour`) were converted to factor type.  
- The `converted` column was transformed into a binary numerical format (0 for non-conversion, 1 for conversion).  

### Exploratory Data Analysis (EDA)  
- Summary statistics were generated to understand the distribution of key variables.  
- Conversion rates were analyzed across the test groups (ad vs. PSA).  
- Boxplots and histograms were used to visualize total ads distribution across test groups.  
- Bar charts were employed to assess the trend of ads served by day and hour.

---

## Statistical Tests and Analysis  

### Chi-Square Test  
A Chi-Square test was performed to determine whether there is a significant association between exposure to advertisements and conversion rates.  

**Hypotheses:**  
- **H₀:** There is no significant difference in conversion rates between users exposed to ads and those who saw PSAs.  
- **H₁:** There is a significant difference in conversion rates between the two groups.  

The results indicated a statistically significant difference between the groups, confirming the effectiveness of advertisements in driving conversions.

---

### Factorial ANOVA  
A factorial ANOVA was conducted to assess the impact of multiple factors on conversion rates, including:  
- `test_group` (Ad vs. PSA)  
- `most_ads_day` (Day of the week)  
- `most_ads_hour` (Hour of the day)  
- `total_ads` (Total number of ads viewed)  

Interaction effects between these variables were also evaluated.

**Findings:**  
- All main effects were statistically significant.  
- A strong interaction effect was observed between `most_ads_day` and `most_ads_hour`, suggesting that the effectiveness of advertisements varies depending on the time of exposure.  
- The number of ads viewed (`total_ads`) was identified as the strongest predictor of conversion.  

---

### Tukey HSD Post-Hoc Test  
A post-hoc Tukey HSD test was performed to identify specific differences between groups for the factors `most_ads_day` and `most_ads_hour`.  

**Results were visualized using confidence interval plots**, allowing for an assessment of which days and hours showed significant variations in conversion performance. The analysis helped pinpoint the most effective time slots for ad placement.

---

## Machine Learning: Random Forest Model  
A Random Forest classification model was trained to predict conversion outcomes based on ad exposure and other variables.

**Findings:**  
- The total number of ads viewed was the most significant predictor of conversion.  
- The day and hour of ad exposure also contributed to conversion probability.  
- The test group (ad vs. PSA) had a relatively lower impact on prediction compared to total ads seen.

---

## Key Findings  

### Effect of Advertisements on Conversion  
- Users exposed to advertisements had a significantly higher conversion rate than those exposed to PSAs.  

### Influence of Day and Hour on Conversion  
- Certain days of the week (Tuesday-Thursday, Friday) exhibited higher conversion rates compared to others.  
- Conversion rates varied significantly across different hours of the day, with **late mornings (10 AM - 12 PM) and evenings (6 PM - 9 PM) being the most effective periods** for advertisements.  

### Interaction Effects  
- The effectiveness of advertisements is influenced by the **specific combination of day and hour**.  
- Some `(day, hour)` combinations showed significantly higher conversions compared to others, emphasizing the need for **targeted ad scheduling**.  

### Role of Advertisement Frequency  
- A higher number of ads viewed led to an increase in conversions, but beyond a certain threshold, diminishing returns were observed.  
- Overexposure to advertisements may not necessarily lead to additional conversions and can lead to ad fatigue.

---

## Recommendations  

### Optimized Ad Scheduling  
- Prioritize advertisements on **high-converting days** (Tuesday-Thursday, Friday).  
- Increase ad exposure during **peak conversion hours** (10 AM - 12 PM, 6 PM - 9 PM).  
- Reduce ad spend during **low-performing hours** such as early mornings and late nights.  

### Ad Frequency Optimization  
- Implement strategies to **balance ad exposure** and avoid oversaturation.  
- Introduce **retargeting strategies** for users who were exposed to ads but did not convert.  

### Further Experimentation and Refinement  
- Conduct **A/B tests on ad creatives** to refine messaging and design.  
- Explore **user segmentation** to personalize ad experiences based on audience demographics and behavior.

---

## How to Run the Code  

### Prerequisites  
Ensure the following R packages are installed:  
```r
install.packages(c("readxl", "ggplot2", "dplyr", "tidyverse", "ggpubr", "car", "DescTools", "lmtest", "lmerTest", "randomForest"))
```

### Execution Steps  
1. Clone the repository:  
   ```bash
   git clone https://github.com/your-repository-name.git
   cd your-repository-name
   ```
2. Open **RStudio** and set the working directory to the project folder.  
3. Run the R script **AB_testing_analysis.R** step by step.  
4. Review the generated **Tukey HSD plots** in the output directory:
   - `tukey_Day_plot.png`
   - `tukey_hour_plot.png`
   - `tukey_interaction_plot.png`  

---


---

This repository provides a structured and comprehensive approach to evaluating A/B testing results for ad campaigns. By leveraging statistical and machine learning techniques, businesses can optimize their ad strategies for maximum efficiency.  

For further improvements, additional **segmentation analysis, personalization strategies, and advanced machine learning models** can be explored.
