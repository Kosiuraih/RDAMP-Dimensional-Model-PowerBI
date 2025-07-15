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
