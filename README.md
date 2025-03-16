## **Spotify Global Song Popularity Trend Analysis & Regional Insights**
**SQL Data Cleaning and Tableau Dashboard for Spotify Data Visualization**

### **Project Overview**
This project analyzes the Top Spotify Songs in 73 Countries dataset by Asaniczka on Kaggle. The goal was to identify regional growth patterns in song popularity using SQL for data manipulation and Tableau for data visualization. Key insights include notable seasonal growth trends in non-western countries and consistent growth in western markets.

🔗 **[Interactive Tableau Dashboard](https://public.tableau.com/shared/R8692W9MW?:display_count=n&:origin=viz_share_link)**  
📂 **[Dataset: Top Spotify Songs in 73 Countries](https://www.kaggle.com/datasets/asaniczka/top-spotify-songs-in-73-countries-daily-updated)**

---

### **Key Insights**
📈 **Notable Growth Pattern**  
A distinct ebb and flow in song popularity growth, particularly from March to July, was most evident in non-western countries.  

🌍 **Western Markets**  
Western countries exhibited a more consistent growth pattern, showing stability over time.  

🔍 **Regional Differences**  
A clear contrast in song popularity growth between western and non-western countries suggests further investigation could provide insights for targeted marketing.

---

### **Tech Stack**
- **SQL (MySQL)** – Data cleaning and transformation
- **Tableau** – Data visualization and dashboard creation

---

### **Methods**

#### **Data Cleaning (SQL)**
✔ Removed duplicates and missing data from the dataset.  
✔ Standardized column data types and formatting for consistency.  
✔ Checked for outliers to ensure the quality of the analysis.

---

### **Visualizations (Tableau)**
📌 **World Heat Map** – Visualized regional popularity trends.  
📌 **Bar Chart** – Compared growth rates across countries.  
📌 **Line Graph** – Illustrated fluctuations in average song popularity growth over time.

---

### **Next Steps**
The growth rate anomaly between western and non-western countries warrants further investigation into underlying factors. Insights from this analysis could help businesses optimize marketing strategies, such as identifying "hot months" for song releases or promotions.

---

#### **Sample SQL Query:**
```sql
-- Flag outliers based on the range of 0 to 100 for popularity
UPDATE goxx 
SET popularity_outlier = CASE
    WHEN popularity < 0 OR popularity > 100 THEN 1
    ELSE 0
END;
