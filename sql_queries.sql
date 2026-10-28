-- Query 1: Overall Sales Performance
SELECT
    SUM(Sales_Amount) AS total_sales,
    SUM(Quantity_Sold) AS total_quantity,
    COUNT(*) AS total_records,
    COUNT(DISTINCT Product_ID) AS distinct_products
FROM innomatics.default.sales_data;

-- Query 2: Top 5 Products by Revenue
SELECT
    Product_ID,
    SUM(Sales_Amount) AS total_sales,
    SUM(Quantity_Sold) AS total_quantity
FROM innomatics.default.sales_data
GROUP BY Product_ID
ORDER BY total_sales DESC
LIMIT 5;
-- Query 3: Regional Sales Performance

SELECT
    Region,
    SUM(Sales_Amount) AS total_sales,
    SUM(Quantity_Sold) AS total_quantity
FROM innomatics.default.sales_data
GROUP BY Region
ORDER BY total_sales DESC;
-- Query 4: Monthly Sales Trend

SELECT
    DATE_FORMAT(TO_DATE(Sale_Date), 'yyyy-MM') AS sales_month,
    SUM(Sales_Amount) AS total_sales
FROM innomatics.default.sales_data
GROUP BY DATE_FORMAT(TO_DATE(Sale_Date), 'yyyy-MM')
ORDER BY sales_month;
-- Query 5: Product Category Revenue Contribution
SELECT
    Product_Category,
    SUM(Sales_Amount) AS category_sales,
    ROUND(
        SUM(Sales_Amount) * 100.0 /
        SUM(SUM(Sales_Amount)) OVER (),
        2
    ) AS sales_contribution_pct
FROM innomatics.default.sales_data
GROUP BY Product_Category
ORDER BY category_sales DESC;
