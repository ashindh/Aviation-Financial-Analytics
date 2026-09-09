USE aviation_finance;


-- =========================================================
-- 1. DATASET VALIDATION
-- =========================================================

SELECT
    COUNT(*) AS Total_Records
FROM flight_data_cleaned;


-- =========================================================
-- 2. OVERALL FINANCIAL KPIs
-- =========================================================

SELECT
    SUM(`Revenue (USD)`) AS Total_Revenue,
    SUM(`Operating Cost (USD)`) AS Total_Operating_Cost,
    SUM(`Profit (USD)`) AS Total_Profit,
    ROUND(AVG(`Revenue (USD)`), 2) AS Avg_Revenue,
    ROUND(AVG(`Operating Cost (USD)`), 2) AS Avg_Operating_Cost,
    ROUND(AVG(`Profit (USD)`), 2) AS Avg_Profit,
    ROUND(AVG(`Debt-to-Equity Ratio`), 2) AS Avg_Debt_to_Equity_Ratio
FROM flight_data_cleaned;


-- =========================================================
-- 3. PROFITABILITY DISTRIBUTION
-- =========================================================

SELECT
    CASE
        WHEN `Is_Profitable` = 1 THEN 'Profitable'
        ELSE 'Loss-Making'
    END AS Profitability,
    COUNT(*) AS Record_Count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM flight_data_cleaned),
        2
    ) AS Percentage
FROM flight_data_cleaned
GROUP BY Profitability;


-- =========================================================
-- 4. PROFITABLE VS LOSS-MAKING FINANCIAL COMPARISON
-- =========================================================

SELECT
    CASE
        WHEN `Is_Profitable` = 1 THEN 'Profitable'
        ELSE 'Loss-Making'
    END AS Profitability,
    COUNT(*) AS Record_Count,
    ROUND(AVG(`Revenue (USD)`), 2) AS Avg_Revenue,
    ROUND(AVG(`Operating Cost (USD)`), 2) AS Avg_Operating_Cost,
    ROUND(AVG(`Profit (USD)`), 2) AS Avg_Profit,
    ROUND(AVG(`Cost_to_Revenue_Ratio`), 2) AS Avg_Cost_to_Revenue_Ratio,
    ROUND(AVG(`Revenue per ASK`), 2) AS Avg_Revenue_per_ASK,
    ROUND(AVG(`Cost per ASK`), 2) AS Avg_Cost_per_ASK
FROM flight_data_cleaned
GROUP BY Profitability;


-- =========================================================
-- 5. HIGHEST COST-TO-REVENUE RECORDS
-- =========================================================

SELECT
    `Flight Number`,
    `Revenue (USD)`,
    `Operating Cost (USD)`,
    `Profit (USD)`,
    `Cost_to_Revenue_Ratio`
FROM flight_data_cleaned
WHERE `Revenue (USD)` > 0
ORDER BY `Cost_to_Revenue_Ratio` DESC
LIMIT 20;


-- =========================================================
-- 6. LARGEST LOSS-MAKING RECORDS
-- =========================================================

SELECT
    `Flight Number`,
    `Revenue (USD)`,
    `Operating Cost (USD)`,
    `Profit (USD)`,
    `Cost_to_Revenue_Ratio`
FROM flight_data_cleaned
ORDER BY `Profit (USD)` ASC
LIMIT 20;


-- =========================================================
-- 7. UNIT ECONOMICS
-- =========================================================

SELECT
    ROUND(AVG(`Revenue per ASK`), 2) AS Avg_Revenue_per_ASK,
    ROUND(AVG(`Cost per ASK`), 2) AS Avg_Cost_per_ASK,
    ROUND(
        AVG(`Revenue per ASK`) -
        AVG(`Cost per ASK`),
        2
    ) AS Avg_Unit_Margin
FROM flight_data_cleaned;


-- =========================================================
-- 8. UNIT ECONOMICS BREAK-EVEN CHECK
-- =========================================================

SELECT
    COUNT(*) AS Records_Above_Unit_Cost,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM flight_data_cleaned),
        2
    ) AS Percentage
FROM flight_data_cleaned
WHERE `Cost per ASK` > `Revenue per ASK`;


-- =========================================================
-- 9. FUEL EFFICIENCY VS UNIT COST
-- =========================================================

SELECT
    CASE
        WHEN `Fuel Efficiency (ASK)` < 3 THEN 'Low Efficiency'
        WHEN `Fuel Efficiency (ASK)` < 4 THEN 'Medium Efficiency'
        ELSE 'High Efficiency'
    END AS Efficiency_Category,
    COUNT(*) AS Record_Count,
    ROUND(AVG(`Cost per ASK`), 2) AS Avg_Cost_per_ASK
FROM flight_data_cleaned
GROUP BY Efficiency_Category
ORDER BY Avg_Cost_per_ASK;


-- =========================================================
-- 10. AVERAGE PROFIT BY DELAY CATEGORY
-- =========================================================

SELECT
    CASE
        WHEN `Delay (Minutes)` = 0 THEN 'No Delay'
        WHEN `Delay (Minutes)` <= 30 THEN '1-30 Minutes'
        WHEN `Delay (Minutes)` <= 60 THEN '31-60 Minutes'
        ELSE '60+ Minutes'
    END AS Delay_Category,
    COUNT(*) AS Record_Count,
    ROUND(AVG(`Profit (USD)`), 2) AS Avg_Profit
FROM flight_data_cleaned
GROUP BY Delay_Category
ORDER BY Avg_Profit DESC;


-- =========================================================
-- 11. FLIGHT-LEVEL FINANCIAL PERFORMANCE
-- =========================================================

SELECT
    `Flight Number`,
    COUNT(*) AS Record_Count,
    ROUND(AVG(`Revenue (USD)`), 2) AS Avg_Revenue,
    ROUND(AVG(`Operating Cost (USD)`), 2) AS Avg_Operating_Cost,
    ROUND(AVG(`Profit (USD)`), 2) AS Avg_Profit,
    ROUND(AVG(`Net Profit Margin (%)`), 2) AS Avg_Net_Profit_Margin
FROM flight_data_cleaned
GROUP BY `Flight Number`
ORDER BY Avg_Profit DESC;