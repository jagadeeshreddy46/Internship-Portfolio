-- Total number of orders in the database

SELECT COUNT(*) AS TotalOrders FROM global_store_sales;

--Top 10 Totals

SELECT * FROM global_store_sales LIMIT 10;

-- Total revenue generated from all sales

select sum(Sales) as Total_Revenue from global_store_sales;

-- Total profit generated from all sales By Category
select Category, sum(profit) as Total_profit from global_store_sales group by Category;

--Sales greater than 10000

select * from global_store_sales where Sales>10000;

--Average order value

SELECT AVG(Sales) AS avg_order_value FROM global_store_sales;

--Top 10 categories by total sales

select "Product ID","Product Name",sum(Sales) as Total_sales from global_store_sales group by "Product ID","Product Name" order by Total_Sales DESC LIMIT 10;

--Total sales by sub-category

select "Sub-Category", sum(Sales) as Total_sales from global_store_sales group by "Sub-Category" order by Total_Sales DESC;

--Total profit by region

SELECT "Region",sum(Profit) as Total_Profit From global_store_sales group by "Region" order by Total_Profit DESC;

--Unique Customers

Select DISTINCT "Customer ID" from global_store_sales;

--Total sales by Segment

SELECT "Segment",sum(Sales) as Total_Sales from global_store_sales group by "Segment" order by Total_Sales DESC;

--Number of orders by Ship Mode

Select "Ship Mode",count(*) as Total_Orders from global_store_sales group by "Ship Mode";

--Monthly Revenue Trend

Select strftime('%Y-%m',"Order Date") as month,SUM(Sales) as monthly_sales from global_store_sales group by month;

--Top 5 Products by Revenue

Select "Product ID","Product Name","Order Date",SUM(Sales) as Revenue from global_store_sales group by "Product Name" order by Revenue DESC LIMIT 5;

--Loss Making Products

Select "Product ID","Product Name",SUM(Profit) as Total_Profit from global_store_sales group by "Product Name" Having Total_Profit < 0 order by Total_Profit;

--Top 10 LOSS MAKING Products

Select "Product ID","Product Name",SUM(Profit) as Total_Profit from global_store_sales group by "Product Name" Having Total_Profit < 0 order by Total_Profit LIMIT 10;

--Average Discount By Category

select "Category",AVG(Discount) as Average_Discount from global_store_sales group by "Category";

--High Discount Orders

select "Category",count(*) as High_Discount_orders from global_store_sales where Discount >0.5;

--Profit Margin By Category

select "Category",sum(Profit)*100.0 /sum(Sales) as Profit_margin from global_store_sales group by "Category";

--Total sales and profit by market

select Market,sum(Sales) as Total_Sales,sum(Profit) as Total_Profit from global_store_sales group by market order by Total_Sales DESC;

--Total 5 Sub Categories by profit

select "Sub-Category" ,sum(Profit) as Total_Profit FROM global_store_sales group by "Sub-Category" order by Total_Profit DESC LIMIT 5;\

