CREATE DATABASE aviation_finance;
USE aviation_finance;
SELECT COUNT(*) FROM flight_data;

SELECT 
    `Flight Number`,
    AVG(`Delay (Minutes)`) AS Avg_Delay_Minutes,
    AVG(`Maintenance Downtime (Hours)`) AS Avg_Maintenance_Hrs,
    SUM(`Revenue (USD)`) AS Total_Revenue,
    SUM(`Operating Cost (USD)`) AS Total_Operating_Cost,
    SUM(`Net Profit Margin (%)`) AS Route_Gross_Margin,
    AVG(`Load Factor (%)`) AS Avg_Load_Factor
FROM flight_data
GROUP BY `flight number`
ORDER BY Route_Gross_Margin ASC;