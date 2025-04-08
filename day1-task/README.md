# 🧹 Data Cleaning: Customer Personality Analysis  
**Internship Task | Elevate Labs**  
_By Meet Vachhani_

---

## 📌 Objective  
Clean and prepare the **Customer Personality Analysis** dataset by handling missing values, standardizing data, fixing data types, and ensuring consistency for better future analysis.

---

## 📂 Dataset  
**Source:** Kaggle  
**File Used:** `marketing_campaign.csv`  
**Rows:** ~2,240  
**Columns:** 29

---

## 🛠️ Tools Used  
- Python (Pandas, NumPy)
- Jupyter Notebook

---

## ✅ Cleaning Steps Summary

| Step | Description |
|------|-------------|
| 1. 📥 Load Data | Read the CSV with appropriate separators |
| 2. 🔎 Missing Values | Identified and filled missing `Income` values using median |
| 3. 🧽 Remove Duplicates | Dropped duplicate rows |
| 4. 🧼 Standardization | Cleaned text values in `Education`, `Marital_Status` |
| 5. 📅 Format Dates | Unified `Dt_Customer` to `dd-mm-yyyy` format |
| 6. 🏷️ Column Names | Converted column headers to `snake_case` |
| 7. 🔢 Fix Data Types | Converted age to integer, others to categorical |
| 8. 🚫 Outlier Removal | Removed outliers from `Income` using IQR method |
| 9. 💾 Save | Exported cleaned dataset to `customer_personality_cleaned.csv` |

---

## 📊 Extra Step
- Derived **Age** column from `Year_Birth`
- Detected and removed extreme outliers in income for cleaner analysis

---

## 📁 Output  
- ✅ Final Cleaned Dataset: `customer_personality_cleaned.csv`  
- 📓 Jupyter Notebook with step-wise print outputs for validation

---

## 🧠 Learnings  
- Handling real-world inconsistencies like missing values and text formatting
- Gained hands-on experience with Pandas data cleaning functions
- Understood the importance of reproducible and readable cleaning workflows

---

## 🚀 Next Steps  
Explore customer segmentation, RFM analysis, or predictive modeling based on this clean dataset.

---

> “Clean data is the foundation of reliable insights.”  
