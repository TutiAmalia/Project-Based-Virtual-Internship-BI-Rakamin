SELECT 
	o."Date" AS order_date,
	pc."CategoryName" AS category_name,
	p."ProdName" AS product_name,
	round(p."Price"::NUMERIC,2) AS product_price,
	o."Quantity" AS order_qty,
	round(sum(p."Price" * o."Quantity")::NUMERIC, 2) AS total_sales,
	c."CustomerEmail"  AS cust_email,
	c."CustomerCity" AS cust_city
FROM 
	"Orders" o 
	JOIN "Customers" c ON o."CustomerID"  = c."CustomerID"
	JOIN "Products" p ON o."ProdNumber" = p."ProdNumber"
	JOIN "ProductCategory" pc ON p."CategoryID" = pc."CategoryID" 
GROUP BY 
	o."Date",
	pc."CategoryName",
	p."ProdName",
	p."Price",
	o."Quantity",
	c."CustomerEmail",
	c."CustomerCity" 
ORDER BY order_date, order_qty;
