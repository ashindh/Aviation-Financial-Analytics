# Aviation Fleet Financial Health & Cost Optimization Engine

**Author:** Ashindh Anil  
**Role Target:** Financial Data Analyst  

## 📌 Executive Summary
This project bridges the gap between computerized financial accounting principles and advanced data analytics. Designed from the perspective of a Financial Data Analyst, this repository analyzes a 200,000-row aviation dataset to identify profit bleeds, assess operational risk, and build predictive machine learning models focusing on unit economics (Cost per ASK). 

Leveraging a foundational understanding of commerce and business analytics, this project translates raw operational data into actionable, bottom-line financial insights suitable for CFO-level decision-making.

## 🧠 Business Problem & Strategic Approach
Aviation is a capital-intensive industry where high gross revenue does not guarantee profitability. The objective of this project was to audit fleet operations, identify the root causes of financial loss, and build a strategic Power BI dashboard to monitor financial leverage and operational efficiency. 

The analysis was structured in three core phases:
1. **Financial Auditing & Feature Engineering:** Establishing baseline ledger health and profitability ratios to isolate loss-making flights.
2. **Statistical Variance Analysis:** Testing the mathematical correlation between operational delays and profit margins to challenge common operational assumptions.
3. **Predictive Cost Modeling:** Utilizing Machine Learning to forecast unit costs based on physical operational inputs.

## 🧰 Tech Stack & Tools
* **Languages:** Python, SQL
* **Data Manipulation:** Pandas, NumPy
* **Machine Learning:** Scikit-Learn (Random Forest Regressor, Feature Importance Extraction)
* **Statistical Analysis:** SciPy, Correlation Matrices, Cohort Analysis
* **Data Visualization & BI:** Power BI (Power Query, Executive Dashboards), Matplotlib, Seaborn
* **Environment:** Jupyter Notebooks / Google Colab

## 📂 Repository Structure
* **`notebooks/`**: Contains the core Python analytical pipeline.
  * `01_airlinedata_cleaned.ipynb`: Data cleaning and financial feature engineering (`Cost_to_Revenue_Ratio`, `Is_Profitable`).
  * `02_airlinedata_statipynb.ipynb`: Statistical analysis proving the lack of correlation between flight delays and profit loss.
  * `03_airlinedata_ML.ipynb`: Random Forest predictive model forecasting Unit Cost (Cost per ASK).
* **`dashboard/`**: Contains the business deliverables.
  * `airlinepbi.pbix`: Interactive Power BI Executive Dashboard.
  * `airlinepbi.pdf`: Static dashboard export for quick viewing.
  * `dashboard_1.jpg` & `dashboard_2.jpg`: Dashboard visual previews.
* **`data/`**: 
  * `data_source_info.txt`: Contains the Kaggle link to the raw Aviation KPIs dataset.
  * *Reproduction Note: To preserve version control efficiency, the raw 200,000+ row dataset is not hosted in this repository. To reproduce this analysis, download the raw data via the Kaggle link provided in `data_source_info.txt`, then run `01_airlinedata_cleaned.ipynb` to generate the `Aviation_Financial_Cleaned.csv` file locally.*



## 📊 Key Business Findings & Insights

### 1. The "Delay vs. Profit" Myth
A common operational assumption is that flight delays are a primary driver of financial loss. Statistical cohort analysis proved this false within this dataset. The correlation between `Delay (Minutes)` and `Profit (USD)` was calculated at **0.002**. Severe delays (90+ minutes) yielded an average profit of $5,223, which is nearly identical to the $5,273 average profit of flights with minimal delays, indicating that operational inconveniences do not directly scale to ledger losses.

### 2. Unit Economics over Absolute Costs
An initial attempt to predict absolute `Operating Cost (USD)` yielded an R-squared of near zero (-0.001). Recognizing that total costs are tied to flight scale rather than pure efficiency, the model was pivoted to predict **Unit Economics (Cost per ASK)**. This adjustment correctly aligned the machine learning logic with financial realities, proving that operational metrics drive approximately 17.8% of the fluctuation in unit costs.

### 3. Fuel Efficiency is the Primary Cost Lever
The Random Forest feature importance extraction identified **Fuel Efficiency** as the overwhelming driver of unit costs, carrying an **81.8% weight** compared to other metrics. Optimizing load factors (5.4% weight) or turnaround times (3.5% weight) offers minimal financial relief compared to strategic fuel management and route optimization.
## 📈 Power BI Executive Dashboard
The concluding deliverable is a highly interactive Power BI dashboard highlighting the exact break-even thresholds and debt risks to guide cost-saving strategies. 
* **The CFO's Ledger:** High-level summations of gross revenue, operating expenses, and fleet profitability rates.
* **The Break-Even Matrix:** A scatter plot mapping unit cost vs. unit revenue.
* **Financial Leverage Risk:** Gauge visuals monitoring the Debt-to-Equity ratio. 

### Dashboard Previews
*(Note: Images below reflect the interactive Power BI dashboard located in the `dashboard/` folder)*

![CFO Ledger and Break-Even Matrix](dashboard/dashboard_1.jpg)

![Fuel Inefficiency and Operational Risk](dashboard/dashboard_2.jpg)
