select * from pizzas;

select * from pizza_types;

select * from orders;

select * from order_details;

-- Basic
-- Retrieve the total number of orders placed.
SELECT 
    COUNT(order_id) AS TotalNumOfOrders
FROM
    orders;

-- Calculate the total revenue generated from pizza sales.
SELECT ROUND(SUM(order_details.quantity * pizzas.price),2) AS Revenue
FROM order_details
JOIN pizzas 
ON pizzas.pizza_id = order_details.pizza_id;
 
-- Identify the highest-priced pizza.
SELECT 
    pizza_types.name, 
    pizzas.price AS CostlyPizza
FROM pizzas
JOIN pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
limit 1;

SELECT 
    MAX(price) AS HighestPrice
FROM
    pizzas;

-- Identify the most common pizza size ordered.
SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS Sales_by_Size
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY Sales_by_Size DESC;

-- List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pizza_types.name,
    SUM(order_details.quantity) AS Sales_by_Pizza
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.name
ORDER BY Sales_by_Pizza DESC
LIMIT 5;

-- Intermediate:
-- Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
    pizza_types.category,
    SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;

-- Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(time) AS hour, COUNT(order_id) AS orders_cnt
FROM
    orders
GROUP BY HOUR 
order by orders_cnt desc;

-- Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category, COUNT(pizza_type_id) 
FROM
    pizza_types
GROUP BY category;

-- Group the orders by date and calculate the average number of ordered per day.
select avg(num_of_orders) from
(SELECT 
    date, COUNT(order_id) as num_of_orders
FROM
    orders
GROUP BY date) as avgorders;

-- Group the orders by date and calculate the average number of pizza ordered per day.
SELECT 
    AVG(numofpizzaordered)
FROM
    (SELECT 
        orders.date,
            SUM(order_details.quantity) AS numofpizzaordered
    FROM
        orders
    JOIN order_details ON order_details.order_id = orders.order_id
    GROUP BY orders.date) AS numofpizzaordered;

-- Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pizza_types.name,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
limit 3;

-- Advanced:
-- Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pizza_types.category,
    round((SUM(order_details.quantity * pizzas.price) / (SELECT 
            ROUND(SUM(order_details.quantity * pizzas.price),
                        2) AS Revenue
        FROM
            order_details
                JOIN
            pizzas ON pizzas.pizza_id = order_details.pizza_id) * 100),2) as revenuepercentage
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
order by revenuepercentage desc;
 
-- Analyze the cumulative revenue generated over time.
select date, sum(revenue) over(order by date) as cum_revenue from
(SELECT 
    orders.date,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    orders
        JOIN
    order_details ON order_details.order_id = orders.order_id
    join pizzas on pizzas.pizza_id = order_details.pizza_id
    group by orders.date) as sales;
    
    -- Determine the top 3 most ordered pizza types based on revenue for each pizza category. 
  select category, name, revenue, rn as rankbysales from
  (select category, name, revenue, rank() over(partition by category order by revenue) as rn from  
  (SELECT 
    pizza_types.category,pizza_types.name, SUM(order_details.quantity * pizzas.price) as revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category, pizza_types.name) as catrev) as rankcat 
where rn<=3; 