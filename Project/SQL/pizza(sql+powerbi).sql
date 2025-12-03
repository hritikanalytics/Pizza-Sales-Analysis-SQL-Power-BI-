-- total revenue:

select round(sum(pizza_sales.total_price),2) total_revenue
from pizza_sales;

-- average order value: 

select (sum(total_price)/count(order_id)) avg_order_price 
from pizza_sales; 

-- total pizzas sold:

select sum(quantity) total_pizzas_sold
from pizza_sales;

-- total orders:.

select count(distinct(order_id)) total_orders
from pizza_sales;

-- average pizzas per order:

select sum(quantity)/count(distinct(order_id)) avg_pizzas_per_order  
from pizza_sales;

-- daily trend for total orders

select weekday(order_date),dayname(order_date),count(order_id)
from pizza_sales
group by weekday(order_date),dayname(order_date);

-- hourly trend for total orders

select hour(order_time), count(order_id)
from pizza_sales
group by hour(order_time);

-- monthly trend for total orders

select month(order_date) month_number, monthname(order_Date) months,count(order_id)
from pizza_sales
group by month(order_date),monthname(order_date);

-- percentage of sales by pizza category.

select pizza_category, 
round((sum(total_price)  /(select sum(total_price)from pizza_sales))*100,2) as category_sales_pert
from pizza_sales
group by pizza_category;

-- percentage of sales by pizza_size

select pizza_size,round((sum(total_price)  /(select sum(total_price)from pizza_sales))*100,2) as category_sales_pert
from pizza_sales
group by pizza_size;

-- total pizzas sold by pizza category

select pizza_category, count(order_id) total_pizzas_sold
from pizza_sales
group by pizza_category;

-- top 5 best seller by total pizzas sold

select pizza_name, sum(total_price) 
from pizza_sales
group by pizza_name
order by sum(total_price) desc
limit 5;

--  bottom 5 worst sellers by total pizzas sold

 select pizza_name, round(sum(total_price),2) 
from pizza_sales
group by pizza_name
order by sum(total_price) 
limit 5
