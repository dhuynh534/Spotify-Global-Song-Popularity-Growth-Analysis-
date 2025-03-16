## **Spotify Global Song Popularity Trend Analysis & Regional Insights**
**SQL Data Cleaning and Tableau Dashboard for Spotify Data Visualization**

### **Project Overview**
This project analyzes the Top Spotify Songs in 73 Countries dataset by Asaniczka on Kaggle. The goal was to identify regional growth patterns in song popularity using SQL for data manipulation and Tableau for data visualization. Key insights include notable seasonal growth trends in non-western countries and consistent growth in western markets.

🔗 **[Interactive Tableau Dashboard](https://public.tableau.com/shared/R8692W9MW?:display_count=n&:origin=viz_share_link)**  
📂 **[Dataset: Top Spotify Songs in 73 Countries](https://www.kaggle.com/datasets/asaniczka/top-spotify-songs-in-73-countries-daily-updated)**

---

### Key Insights and Actionable Strategies

#### 📈 Notable Growth Pattern  
**Insight**: A distinct ebb and flow in song popularity growth, particularly from March to July, was most evident in non-western countries.

**Actionable Insights**:  
- **Marketing Strategy**: Music labels or streaming services should time the release of new songs or albums to align with the peak growth periods from March to July in non-western countries to maximize exposure.  
- **Promotions**: Run targeted promotional campaigns during these months to capitalize on increased interest in music in these regions. For example, releasing exclusive playlists or region-specific content can cater to heightened user engagement during these months.

#### 🌍 Western Markets  
**Insight**: Western countries exhibited a more consistent growth pattern, showing stability over time.

**Actionable Insights**:  
- **Content Scheduling**: Since growth is more stable, content (like artist collaborations, album releases, or live streams) can be scheduled year-round, with a focus on maintaining steady engagement.  
- **Customer Retention**: Implement loyalty programs or consistent updates in Western markets to sustain the steady growth of popularity. Encourage repeat listens with curated playlists and subscriber-based benefits.

#### 🔍 Regional Differences  
**Insight**: A clear contrast in song popularity growth between western and non-western countries suggests further investigation could provide insights for targeted marketing.

**Actionable Insights**:  
- **Region-Specific Campaigns**: Launch region-specific marketing campaigns based on the distinct growth patterns. While Western markets may benefit from stable year-round campaigns, non-western countries may require more seasonal or event-driven campaigns.  
- **Localization of Content**: Collaborate with local artists or influencers to increase the appeal of new songs in non-western regions, especially during peak growth months. Tailor content to the cultural preferences of these regions to enhance engagement.

---

### **Tech Stack**
- **SQL (MySQL)** – Data cleaning and transformation
- **Tableau** – Data visualization and dashboard creation

---

### **Methods**

#### **Data Cleaning (SQL)**
✔ **Duplicate Removal** – Identified and removed duplicates in the dataset using row numbering, ensuring that only unique entries were included in the analysis.  
✔ **Handling Missing Data** – Addressed missing values by standardizing entries where possible, filling null fields with 'unknown' or other appropriate values.  
✔ **Data Type Standardization** – Standardized column data types (e.g., ensuring that Spotify IDs, names, and other key fields have consistent formats) for better compatibility during analysis.  
✔ **Outlier Detection** – Flagged values outside the acceptable range (e.g., popularity scores outside 0-100) to ensure the dataset's integrity and avoid skewing results.

---

### **Visualizations (Tableau)**  
📌 **World Heat Map** – Created an interactive heatmap to visually display regional popularity trends, helping identify patterns of song growth across different countries.  
📌 **Bar Chart** – Used to compare growth rates of song popularity between countries, highlighting key regions with the most significant fluctuations.  
📌 **Line Graph** – Illustrated the trends and fluctuations in average song popularity growth over time, providing insights into both short-term and long-term shifts in song popularity.

---

### **Next Steps**
The noticeable growth rate anomaly between western and non-western countries calls for a deeper exploration into the underlying factors that may be driving these trends. Potential areas for investigation could include cultural, socio-economic, or regional shifts that influence music preferences during specific times of the year. Additionally, it would be valuable to examine how external factors, such as holidays, festivals, or major events, correlate with spikes in song popularity.

Based on the insights gathered, businesses and streaming platforms can refine their marketing strategies to better align with these regional dynamics. For example, they could pinpoint the "hot months" or seasonal windows where song releases and promotions are most likely to succeed. By tailoring campaigns to these specific periods, businesses can improve engagement, enhance customer loyalty, and increase overall sales or subscriptions.

---

#### **Sample SQL Query:**
```sql
-- Flag outliers based on the range of 0 to 100 for popularity
UPDATE goxx 
SET popularity_outlier = CASE
    WHEN popularity < 0 OR popularity > 100 THEN 1
    ELSE 0
END;
