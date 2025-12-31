# 🍕 Pizza Sales Data Analysis using SQL

## 📌 Project Overview
This project analyzes pizza sales data using **MySQL** to extract actionable business insights related to customer behavior, product performance, revenue contribution, and sales trends. The analysis progresses from **basic exploratory queries** to **advanced SQL techniques**, reflecting a real-world data analytics workflow.

---

## 🗂 Dataset Description
The dataset consists of four relational tables:

- **orders** – Stores order date and time  
- **order_details** – Contains pizza quantity per order  
- **pizzas** – Includes pizza size and price  
- **pizza_types** – Contains pizza names and categories  

These tables are linked using primary and foreign keys, enabling multi-table joins and advanced analysis.

---

## 🎯 Project Objectives
- Analyze total sales and revenue performance  
- Identify top-performing pizzas and categories  
- Understand customer ordering behavior  
- Perform time-based sales analysis  
- Apply advanced SQL concepts for deeper insights  

---

## 🔹 Basic SQL Analysis

### Total Orders
- **21,350 orders placed**

### Total Revenue
- **$817,860.05 total revenue generated**

### Highest Priced Pizza
- **The Greek Pizza – $35.95**

### Most Ordered Pizza Size
| Size | Orders |
|-----|--------|
| Large | 18,526 |
| Medium | 15,385 |
| Small | 14,137 |

### Top 5 Most Ordered Pizzas
- Classic Deluxe Pizza  
- Barbecue Chicken Pizza  
- Hawaiian Pizza  
- Pepperoni Pizza  
- Thai Chicken Pizza  

---

## 🔹 Intermediate SQL Analysis

### Category-wise Quantity Sold
| Category | Quantity |
|---------|----------|
| Classic | 14,888 |
| Supreme | 11,987 |
| Veggie | 11,649 |
| Chicken | 11,050 |

### Order Distribution by Hour
- Peak demand during **12–1 PM** and **6–7 PM**
- Low demand during early mornings and late nights

### Average Sales Metrics
- **~60 orders per day**
- **~138 pizzas sold per day**

### Top Revenue-Generating Pizzas
| Pizza | Revenue |
|------|---------|
| Thai Chicken Pizza | $43,434 |
| Barbecue Chicken Pizza | $42,768 |
| California Chicken Pizza | $41,409 |

---

## 🔹 Advanced SQL Analysis

### Revenue Contribution by Category
| Category | Revenue % |
|---------|-----------|
| Classic | 26.91% |
| Supreme | 25.46% |
| Chicken | 23.96% |
| Veggie | 23.68% |

### Cumulative Revenue Analysis
- Revenue shows steady growth over time
- Indicates consistent and sustainable business performance

### Top 3 Pizzas by Revenue per Category
- **Classic:** Big Meat, Napolitana, Pepperoni Mix  
- **Chicken:** Chicken Alfredo, Chicken Pesto, Southwest Chicken  
- **Veggie:** Spinach Pesto, Green Garden, Mediterranean  
- **Supreme:** Calabrese, Spinach Supreme, Brie Carre  

---

## ✅ Key Insights
- Large pizzas dominate sales volume  
- Chicken pizzas generate the highest revenue  
- Lunch and dinner are peak sales periods  
- Revenue is evenly distributed across categories  
- Advanced SQL enables deeper, category-level insights  

---

## 🏁 Conclusion
This project demonstrates how SQL can be effectively used to transform raw transactional data into meaningful business insights. By applying joins, aggregations, subqueries, and window functions, the analysis uncovers patterns that support data-driven decision-making in the food retail industry.

---

## 🛠 Tools & Technologies
- MySQL  
- MySQL Workbench  
- SQL (Joins, Subqueries, Window Functions)  

---

## 👤 Author
**Durga Prasad**

---

## 🔗 Contact
- **LinkedIn:** https://www.linkedin.com/in/durgaprasadshetty  
- **Email:** prasadshetty1275@gmail.com
