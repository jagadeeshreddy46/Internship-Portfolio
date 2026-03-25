
--Total Number Of Customers

select Count(DISTINCT("Customer ID")) as "Total Number Of Customers"
from global_store_sales;

--Total Profit

SELECT SUM(Profit) AS total_profit
FROM global_store_sales;


--Profit Margin

SELECT 
    ROUND((SUM(Profit) * 100.0 / SUM(Sales)), 2) AS profit_margin_percent
FROM global_store_sales;

--Average Order Value

SELECT AVG(Sales) AS avg_order_value
FROM global_store_sales;

--Total Revenues

SELECT SUM(Sales) AS total_revenue
FROM global_store_sales;

--Category Level Performance

-- Category-wise sales, profit and margin
SELECT Category,
       SUM(Sales) AS total_sales,
       SUM(Profit) AS total_profit,
       ROUND((SUM(Profit)*100.0 / SUM(Sales)), 2) AS profit_margin_percent
FROM global_store_sales
GROUP BY Category
ORDER BY profit_margin_percent ASC;
         

-- 2.Sub Category Loss Prediction

-- Sub-categories generating losses

SELECT "Sub-Category",
       SUM(Sales) AS total_sales,
       SUM(Profit) AS total_profit
FROM global_store_sales
GROUP BY "Sub-Category"
ORDER BY total_profit ASC
LIMIT 10;


--3.Discount Impact Analysis

-- Average discount & overall profit

SELECT 
    ROUND(AVG(Discount),2) AS avg_discount,
    SUM(Profit) AS total_profit
FROM global_store_sales;


-- Orders with high discount causing loss

SELECT COUNT(*) AS high_discount_loss_orders
FROM global_store_sales
WHERE Discount > 0.4
AND Profit < 0;

4--Regional Profitability

-- Region-wise profit margin

SELECT Region,
       SUM(Sales) AS total_sales,
       SUM(Profit) AS total_profit,
       ROUND((SUM(Profit)*100.0 / SUM(Sales)),2) AS profit_margin
FROM global_store_sales
GROUP BY Region
ORDER BY profit_margin ASC;

--5.Shipping Cost Impact

-- Total shipping cost vs total profit

SELECT 
    SUM("Shipping Cost") AS total_shipping_cost,
    SUM(Profit) AS total_profit
FROM global_store_sales;
