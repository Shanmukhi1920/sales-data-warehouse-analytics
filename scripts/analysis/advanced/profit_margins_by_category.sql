-- Profitability by Category
SELECT p.category,
       SUM(f.sales_amount) AS revenue,
       SUM(f.sales_amount - p.cost * f.quantity) AS profit,
       CONCAT(ROUND(CAST(SUM(f.sales_amount - p.cost * f.quantity) AS FLOAT) * 100.0 / NULLIF(CAST(SUM(f.sales_amount) AS FLOAT), 0),2),'%') AS profit_margin
FROM gold.fact_sales f
JOIN gold.dim_products p ON f.product_key = p.product_key
GROUP BY p.category
ORDER BY profit DESC;
