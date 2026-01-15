#Q1: Top 10 cities by No of orders
SELECT 
    customer_city, COUNT(*) AS no_of_orders
FROM
    olist_orders_dataset AS orders
        JOIN
    olist_customers_dataset AS customer ON orders.customer_id = customer.customer_id
GROUP BY customer_city
ORDER BY no_of_orders DESC
LIMIT 10;

#--------

#Q2: Top 10 cities by sales
SELECT 
    customers.customer_city,
    ROUND(SUM(payment_value), 0) AS sales
FROM
    olist_orders_dataset AS orders
        JOIN
    olist_order_payments_dataset AS payments ON orders.order_id = payments.order_id
        JOIN
    olist_customers_dataset AS customers ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_city
ORDER BY sales DESC
LIMIT 10;

#--------

#Q3: Top 10 states by No of orders
SELECT 
    customer_state, COUNT(*) AS no_of_orders
FROM
    olist_orders_dataset AS orders
        JOIN
    olist_customers_dataset AS customer ON orders.customer_id = customer.customer_id
GROUP BY customer_state
ORDER BY no_of_orders DESC
LIMIT 10;

#-------

#Q4: Top 10 states by sales
SELECT 
    customers.customer_state,
    ROUND(SUM(payment_value), 0) AS sales
FROM
    olist_orders_dataset AS orders
        JOIN
    olist_order_payments_dataset AS payments ON orders.order_id = payments.order_id
        JOIN
    olist_customers_dataset AS customers ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_state
ORDER BY sales DESC
LIMIT 10;

#------

#Q5.a: Top 10 categories by No of orders
SELECT 
    translation.product_category_name_english AS name_of_category,
    no_orders
FROM
    (SELECT 
        products.product_category_name AS name,
            COUNT(DISTINCT orders.order_id) AS no_orders
    FROM
        olist_orders_dataset AS orders
    JOIN olist_order_items_dataset AS items ON orders.order_id = items.order_id
    JOIN olist_products_dataset AS products ON items.product_id = products.product_id
    GROUP BY products.product_category_name
    ORDER BY no_orders DESC
    LIMIT 10) AS data
        JOIN
    product_category_name_translation AS translation ON data.name = translation.ï»¿product_category_name
ORDER BY no_orders DESC;

#Q5.b: Top 10 categories by Sales
SELECT 
    translation.product_category_name_english AS name_of_category,
    sales
FROM
    (SELECT 
        products.product_category_name AS name,
            ROUND(SUM(items.price + items.freight_value), 0) AS sales
    FROM
        olist_products_dataset AS products
    JOIN olist_order_items_dataset AS items ON products.product_id = items.product_id
    GROUP BY name
    ORDER BY sales DESC
    LIMIT 10) AS data
        JOIN
    product_category_name_translation AS translation ON data.name = translation.ï»¿product_category_name
ORDER BY sales DESC;

#Q5.c: Top 10 categories by No of orders reviews
SELECT 
    translation.product_category_name_english AS name_of_category,
    rating
FROM
    (SELECT 
        products.product_category_name AS name,
            AVG(reivews.review_score) AS rating,
            COUNT(DISTINCT orders.order_id) AS no_of_orders
    FROM
        olist_products_dataset AS products
    JOIN olist_order_items_dataset AS items ON products.product_id = items.product_id
    JOIN olist_orders_dataset AS orders ON items.order_id = orders.order_id
    JOIN olist_order_reviews_dataset AS reivews ON orders.order_id = reivews.order_id
    GROUP BY name
    ORDER BY no_of_orders DESC
    LIMIT 10) AS data
        JOIN
    product_category_name_translation AS translation ON data.name = translation.ï»¿product_category_name
ORDER BY no_of_orders DESC;

#Q6: Top 10 sellers by No of orders with cities, states and revenue
SELECT 
    sellers.seller_id AS id_of_seller,
    COUNT(DISTINCT orders.order_id) AS no_of_orders,
    sellers.seller_city AS city,
    sellers.seller_state AS state,
    ROUND(SUM(items.freight_value + items.price),
            0) AS revenue
FROM
    olist_orders_dataset AS orders
        LEFT JOIN
    olist_order_items_dataset AS items ON orders.order_id = items.order_id
        LEFT JOIN
    olist_sellers_dataset AS sellers ON items.seller_id = sellers.seller_id
GROUP BY id_of_seller , city , state
HAVING sellers.seller_id IS NOT NULL
ORDER BY no_of_orders DESC
LIMIT 10;
