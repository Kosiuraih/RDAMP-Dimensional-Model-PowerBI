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

CREATE VIEW vw_channel_margin_report AS
SELECT 
dom.mode_name AS sales_channel,
SUM(fs.totalSales) AS total_sales,
SUM(fs.profit) AS total_profit,
ROUND(SUM(fs.profit) / NULLIF(SUM(fs.totalSales), 0), 2) AS profit_margin
FROM fact_sales fs
JOIN dim_order_mode dom ON fs.orderModeID = dom.orderModeID
GROUP BY dom.mode_name;

CREATE VIEW vw_region_category_rankings AS
SELECT 
dl.region,
dc.category_name,
SUM(fs.profit) AS total_profit,
RANK() OVER (PARTITION BY dl.region ORDER BY SUM(fs.profit) DESC) AS category_rank
FROM fact_sales fs
JOIN dim_location dl ON fs.locationID = dl.locationID
JOIN dim_category dc ON fs.categoryID = dc.categoryID
GROUP BY dl.region, dc.category_name;
