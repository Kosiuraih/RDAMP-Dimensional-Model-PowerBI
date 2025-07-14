CREATE VIEW vw_discount_impact_analysis AS
SELECT 
dp.productName,
fs.discountAmount,
SUM(fs.totalSales) AS total_sales,
SUM(fs.profit) AS total_profit,
COUNT(*) AS number_of_orders
FROM fact_sales fs
JOIN dim_product dp ON fs.productID = dp.productID
GROUP BY dp.productName, fs.discountAmount;

CREATE VIEW vw_product_seasonality AS
SELECT 
dp.productName,
dd.year,
dd.month,
dd.quarter,
SUM(fs.quantity) AS total_quantity_sold,
SUM(fs.totalSales) AS total_sales
FROM fact_sales fs
JOIN dim_product dp ON fs.productID = dp.productID
JOIN dim_date dd ON fs.dateID = dd.dateID
GROUP BY dp.productName, dd.year, dd.month, dd.quarter;

CREATE VIEW vw_customer_order_patterns AS
SELECT 
ds.segment_name,
dc.customerName,
COUNT(fs.salesID) AS order_count,
AVG(fs.totalSales) AS avg_order_value,
SUM(fs.profit) AS total_profit
FROM fact_sales fs
JOIN dim_customer dc ON fs.customerID = dc.customerID
JOIN dim_segment ds ON fs.segmentID = ds.segmentID
GROUP BY ds.segment_name, dc.customerName;
