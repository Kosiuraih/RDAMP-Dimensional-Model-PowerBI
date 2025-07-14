-- Populate dim_customer
INSERT INTO dim_customer (customerID, customerName)
VALUES 
('C001', 'Alice Smith'),
('C002', 'John Brown'),
('C003', 'Emma Wilson');

-- Populate dim_product
INSERT INTO dim_product (productID, productName)
VALUES 
('P001', 'Flavored Popcorn Mix'),
('P002', 'Olive Oil'),
('P003', 'Children\'s Backpack');

-- Populate dim_location
INSERT INTO dim_location (locationID, city, postCode, region, country)
VALUES 
('L001', 'Birmingham', 'B12', 'West Midlands', 'England'),
('L002', 'Thorpe', 'BD23', 'Yorkshire & the Humber', 'England');

-- Populate dim_date
INSERT INTO dim_date (dateID, day, month, year, quarter)
VALUES 
('2024-06-22', '22', 'June', 2024, 'Q2'),
('2024-03-15', '15', 'March', 2024, 'Q1');


-- Populate dim_category
INSERT INTO dim_category (category_name, sub_category_name)
VALUES 
('Food - Snacks', 'Gourmet Snacks'),
('Accessories', 'Kids\' Bags');

-- Populate dim_segment
INSERT INTO dim_segment (segment_name)
VALUES 
('Consumer'),
('Corporate'),
('Home Office');

-- Populate dim_order_mode
INSERT INTO dim_order_mode (mode_name)
VALUES 
('Online'),
('In-Store');
