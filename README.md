# 🍕 Pizza Sales Analysis | PostgreSQL + Power BI Dashboard

### 📊 Project Overview
This project analyzes pizza sales data to gain business insights and understand key sales patterns.  
Using **PostgreSQL** for data processing and **Power BI** for dashboard visualization, the report uncovers performance metrics such as total revenue, popular categories, sales trends, and top/worst-selling pizzas.

<img width="1362" height="729" alt="image" src="https://github.com/user-attachments/assets/6b197138-265b-405d-b06d-a2e2fbed952d" />

---

## 🧠 Objective
To analyze pizza sales data and visualize:
- Key performance indicators (KPIs)
- Daily and monthly sales trends
- Sales distribution by category and size
- Top and bottom-selling pizzas by revenue, quantity, and orders

---

## 🛠 Tools & Technologies
- **Database:** PostgreSQL  
- **Visualization:** Power BI  
- **Language:** SQL  
- **Dataset:** `pizza_sales.csv`

---

## 🧮 SQL Analysis (PostgreSQL)
Created a database table `PizzaSales` and imported the CSV file using the `COPY` command.

### **Key SQL Queries**
- **Total Revenue:** `SUM(total_price)`
- **Average Order Value:** `SUM(total_price)/COUNT(DISTINCT order_id)`
- **Total Pizzas Sold:** `SUM(quantity)`
- **Total Orders:** `COUNT(DISTINCT order_id)`
- **Average Pizzas per Order:** `SUM(quantity)/COUNT(DISTINCT order_id)`
- **Daily & Monthly Trends:** Used `TO_CHAR(order_date, 'FMDay')` and `TO_CHAR(order_date, 'FMMonth')`
- **Category & Size Analysis:** Percentage of sales by pizza category and size
- **Top & Bottom Sellers:** Top/Bottom 5 pizzas by revenue, quantity, and total orders

---

## 📈 Power BI Dashboard

### **Page 1 – Home Dashboard**
- **KPI Cards:**  
  - Total Revenue  
  - Average Order Value  
  - Total Pizzas Sold  
  - Total Orders  
  - Average Pizzas per Order  
- **Visuals:**  
  - Daily Trend for Total Orders  
  - Monthly Trend for Total Orders  
  - % of Sales by Pizza Category  
  - % of Sales by Pizza Size  
  - Total Pizzas Sold by Category  
- **Filters:**  
  - Date Range  
  - Pizza Category  
- **Insights Panel:**  
  Highlights that January and July have the most orders, and Classic category drives maximum sales.

### **Page 2 – Best/Worst Sellers**
- **Top 5 Pizzas:** by Revenue, Quantity, and Total Orders  
- **Bottom 5 Pizzas:** by Revenue, Quantity, and Total Orders  
- **Best Sellers Section:**  
  - Thai Chicken Pizza contributes maximum revenue  
  - Classic Deluxe Pizza contributes maximum orders and quantity  

---

## 📊 Key Insights
| Metric | Value |
|--------|--------|
| **Total Revenue** | ₹817.86K |
| **Average Order Value** | ₹38.31 |
| **Total Pizzas Sold** | 49,574 |
| **Total Orders** | 21,350 |
| **Avg Pizzas Per Order** | 2.32 |

### Business Insights
- **Peak Months:** January and July  
- **Top Category:** Classic  
- **Popular Size:** Large  
- **Top Seller:** Thai Chicken Pizza  
- **Least Performing Pizza:** The Brie Carre  
- Recommendations: Promote best sellers, redesign offers for low-selling pizzas, and focus marketing around peak months.

---## 🗂 Folder Structure
Pizza-Sales-Analysis/
│
├── pizza_sales.csv # Dataset
├── Pizza_.sql # SQL file with all queries
├── Pizza_Sales_Report.pbix # Power BI dashboard file
├── screenshots/ # Dashboard images
│ ├── Home_Dashboard.png
│ ├── Best_Worst_Sellers.png
└── README.md # Project documentation

🧾 Author

Aadi Chauhan
Data Analyst | SQL | Power BI | Python | Excel
🔗 [[LinkedIn Profile Link](http://www.linkedin.com/in/aadi-chauhan-675903368)]

⭐ If you found this project insightful, consider giving it a star on GitHub!
