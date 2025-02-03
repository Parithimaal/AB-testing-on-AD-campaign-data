# AB-testing-on-AD-campaign-data
**Author:** Balaji Adithya Dhandapani Shanmugasundaram  
**Date:** August 12, 2023  

## 📌 Project Overview  
This project analyzes an **A/B test** to determine the effectiveness of an advertising campaign. The dataset consists of two test groups:  

- **"ad"** (experimental group exposed to ads)  
- **"psa"** (control group exposed to public service announcements)  

### 🔍 Key Questions Addressed  
- Would the ad campaign be successful in increasing conversions?  
- If successful, how much of the success can be attributed to the ads?  
- What is the impact of ad exposure frequency, day, and time on conversions?  

## 📂 Dataset Information  
**Source:** [Kaggle - Marketing A/B Testing Dataset](https://www.kaggle.com/datasets/faviovaz/marketing-ab-testing/data)  

### 📌 Data Dictionary  
| Column | Description |
|--------|------------|
| `test_group` | Indicates whether a user was in the ad or PSA group. |
| `converted` | Whether the user made a purchase (1) or not (0). |
| `total_ads` | Number of ads seen by the user. |
| `most_ads_day` | The day the user saw the highest number of ads. |
| `most_ads_hour` | The hour when the user saw the highest number of ads. |

## 🛠 Tools & Technologies  
- **Programming Language:** R  
- **Libraries:** `ggplot2`, `dplyr`, `tidyverse`, `ggpubr`, `car`, `DescTools`, `lmtest`  
- **Statistical Methods:** A/B testing, Chi-square test, Logistic regression, Likelihood ratio test (LRT)  

## 📊 Exploratory Data Analysis (EDA)  
### 🔹 Key Observations  
- The dataset is highly **imbalanced** (only **4.1% of users** are in the PSA group).  
- The overall **conversion rate is low (2.4%)**.  
- **Monday and Friday** had the highest number of ads shown, while **Tuesday and Wednesday had the least**.  
- Ads were mostly displayed between **11 AM to 3 PM**.  

## 🧪 Hypothesis Testing  

### ✅ **Chi-Square Test**  
The Chi-square test was performed to check if conversion rates differed between the `ad` and `psa` groups. X-squared = 54.318, df = 1, p-value = 1.705e-13.

**Conclusion:** Since `p < 0.05`, the difference in conversion rates is statistically significant.

## 📈 Logistic Regression Analysis  

### **Base Model (No Interaction Terms)**  
- The **PSA group** has a **52.5% lower conversion rate** than the AD group.  
- **Every additional ad increases conversion odds by ~1.03%**.  
- **Monday and Tuesday have the highest conversion rates**.  

### **Interaction Effects**  
| Interaction | Result |
|-------------|--------|
| `test_group:most_ads_hour` | **Significant**: Later hours **increase conversion rates more for PSA than AD**. |
|  `test_group:total_ads` | **Not significant**: The effect of total ads is similar across test groups. |
|  `test_group:most_ads_day` | **Tuesday had a significant negative interaction**: PSA conversions were lower on Tuesdays. |

## 🚀 Final Recommendations  

### 1️⃣ **Increase Ad Spending**  
- The **PSA group has significantly lower conversion rates (~52.5% less likely to convert)** than the AD group.  
- **More ads should be allocated to the AD group to maximize conversions**.  

### 2️⃣ **Schedule Ads in Later Hours, Especially for PSA Campaigns**  
- Later hours significantly **increase conversions**.  
- **PSA campaigns benefit more from later ad exposure** than AD campaigns.  

### 3️⃣ **Prioritize Advertising on Monday & Tuesday**  
- These days **have the highest conversion rates**.  
- **Allocate more budget and ad placements to these days** for better performance.  

### 4️⃣ **Avoid Running Ads on Saturdays**  
- **Saturday does not show any significant increase in conversions**.  

### 5️⃣ **Keep the Interaction Term for `most_ads_hour` in the Model**  
- The **interaction between `test_group` and `most_ads_hour` was significant**.  
- **Later ad exposure benefits PSA campaigns more than AD campaigns**.  

## 📎 How to Run This Project  

1. Download the dataset from [Kaggle](https://www.kaggle.com/datasets/faviovaz/marketing-ab-testing/data).  
2. Install required R libraries using:  
   ```r
   install.packages(c("ggplot2", "dplyr", "tidyverse", "ggpubr", "car", "DescTools", "lmtest"))


