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

INSERT INTO fact_sales (
customerID,
productID,
locationID,
dateID,
categoryID,
segmentID,
orderModeID,
quantity,
totalSales,
totalCost,
profit,
discountAmount
)
VALUES 
('C006', 'P006', 'L006', DATE '2024-07-30', 5, 1, 2, 1, 6.49, 1.947, 4.543, 0.02),
('C007', 'P007', 'L007', DATE '2023-01-13', 6, 2, 2, 14, 23.99, 6.947, 17.043, 0.10),
('C008', 'P008', 'L008', DATE '2024-01-06', 7, 3, 1, 8, 1.99, 0.297, 1.693, 0.15),
('C009', 'P009', 'L009', DATE '2024-11-13', 8, 1, 1, 13, 6.99, 2.097, 4.893, 0.40);


-- Populate dim_customer
INSERT INTO dim_customer (customerID, customerName)
VALUES 
('C006', 'Riley Johnson'),
('C007', 'Vincent Harris'),
('C008', 'Tanya Uddin'),
('C009', 'Dylan Black');

-- Populate dim_product
INSERT INTO dim_product (productID, productName)
VALUES 
('P006', 'Spicy Tuna Rolls'),
('P007', 'Cereal Dispenser with Portion Control'),
('P008', 'Ramen Noodles'),
('P009', 'Gingerbread House Kit');


-- Populate dim_location
INSERT INTO dim_location (locationID, city, postCode, region, country)
VALUES 
('L006', 'Whitwell', 'DL10', 'South East', 'England'),
('L007', 'Weston', 'GU32', 'South East', 'England'),
('L008', 'Dean', 'OX7', 'West Midlands', 'England'),
('L009', 'Belfast', 'BT2', 'Northern Ireland', 'United Kingdom');


-- Populate dim_date
INSERT INTO dim_date (dateID, day, month, year, quarter)
VALUES 
('2024-07-30', '30', 'July', 2024, 'Q3'),
('2023-01-13', '13', 'January', 2023, 'Q1'),
('2024-01-06', '06', 'January', 2024, 'Q1'),
('2024-11-13', '13', 'November', 2024, 'Q4');


-- Populate dim_category
INSERT INTO dim_category (categoryID, category_name, sub_category_name)
VALUES 
(5, 'Food - Seafood', 'Sushi'),
(6, 'Kitchen', 'Food Storage Solutions'),
(7, 'Food - Pasta', 'Noodles'),
(8, 'Food - Baking', 'Baking Kits');


-- Populate dim_segment
INSERT INTO dim_segment (segmentID, segment_name)
VALUES 
(1, 'Consumer'),
(2, 'Corporate'),
(3, 'Home Office');


-- Populate dim_order_mode
INSERT INTO dim_order_mode (orderModeID, mode_name)
VALUES
(1, 'Online'),
(2, 'In-Store');
