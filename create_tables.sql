CREATE TABLE dim_customer (
customerID VARCHAR (225) PRIMARY KEY,
customerName VARCHAR (225)
);

CREATE TABLE dim_product (
productID VARCHAR (225) PRIMARY KEY,
productName VARCHAR (225)
);

CREATE TABLE dim_location (
locationID VARCHAR (225) PRIMARY KEY,
city VARCHAR (225),
postCode VARCHAR (225),
region VARCHAR (225),
country VARCHAR (225)
);

CREATE TABLE dim_date (
dateID DATE PRIMARY KEY,
day VARCHAR(225),
month VARCHAR(225),
year INT,
quarter VARCHAR(50)
);

CREATE TABLE dim_category (
categoryID INT PRIMARY KEY SERIAL,
category_name VARCHAR(225),
sub_category_name VARCHAR(225)
);

CREATE TABLE dim_segment (
segmentID INT PRIMARY KEY SERIAL,
segment_name VARCHAR(225)
);

CREATE TABLE dim_order_mode (
orderModeID INT PRIMARY KEY SERIAL,
mode_name VARCHAR(225)
);

CREATE TABLE fact_sales (
salesID INT PRIMARY KEY SERIAL,
customerID VARCHAR(225) NOT NULL,
productID VARCHAR(225) NOT NULL,
locationID VARCHAR (225) NOT NULL,
dateID DATE NOT NULL,
categoryID INT NOT NULL,
segmentID INT NOT NULL,
orderModeID INT NOT NULL,
quantity INT,
totalSales DECIMAL(10, 2),
totalCost DECIMAL(10, 2),
profit DECIMAL(10, 2),
discountAmount DECIMAL(10, 2),
FOREIGN KEY (customerID) REFERENCES dim_customer(customerID),
FOREIGN KEY (productID) REFERENCES dim_product(productID),
FOREIGN KEY (locationID) REFERENCES dim_location(locationID),
FOREIGN KEY (dateID) REFERENCES dim_date(dateID),
FOREIGN KEY (categoryID) REFERENCES dim_category(categoryID),
FOREIGN KEY (segmentID) REFERENCES dim_segment(segmentID),
FOREIGN KEY (orderModeID) REFERENCES dim_order_mode(orderModeID)
);
