E-Learning SQL Database Project:

A beginner-friendly SQL project that demonstrates database creation, table relationships, data insertion, and advanced SQL queries using an E-Learning Management System scenario.

📌 Project Overview

This project simulates an online learning platform where:

Learners enroll in courses
Courses belong to different categories
Purchases track course enrollments and sales

The project covers essential SQL concepts including:

Database creation
Table creation
Primary & Foreign Keys
Data insertion
JOIN operations
Aggregation functions
GROUP BY & HAVING
Sorting & filtering
Revenue analysis queries

🛠 Technologies Used
SQL

📂 Database Structure
1. learners

Stores learner details.

Column Name	Data Type	Description
learner_id	INT	Primary Key
full_name	VARCHAR(100)	Learner Name
country	VARCHAR(50)	Country Name

2. courses

Stores available course information.

Column Name	Data Type	Description
course_id	INT	Primary Key
course_name	VARCHAR(150)	Course Title
category	VARCHAR(100)	Course Category
unit_price	DECIMAL(10,2)	Course Price
3. purchases

Stores learner purchase details.

Column Name	Data Type	Description
purchase_id	INT	Primary Key
learner_id	INT	Foreign Key
course_id	INT	Foreign Key
quantity	INT	Quantity Purchased
purchase_date	DATE	Purchase Date
🔗 Table Relationships
learners → connected to purchases
courses → connected to purchases

This demonstrates one-to-many relationships using foreign keys.

📥 Sample Data Included

The project contains sample records for:

5 learners
5 courses
8 purchase transactions
📊 SQL Queries Included
✔ Course Price Formatting

Displays course prices with formatted decimals.

✔ Course Listing

Displays course names and prices sorted by price.

✔ Purchase Report

Shows:

Learner details
Course details
Quantity purchased
Total amount
Purchase date
✔ Total Spending by Learner

Calculates how much each learner spent.

✔ Top 3 Best-Selling Courses

Finds the most purchased courses.

✔ Revenue by Category

Calculates:

Total revenue
Number of unique learners
✔ Multi-Category Learners

Finds learners who purchased courses from multiple categories.

✔ Courses Without Purchases

Identifies courses that have never been purchased.

📚 SQL Concepts Demonstrated

CREATE DATABASE
CREATE TABLE
PRIMARY KEY
FOREIGN KEY
INSERT INTO
SELECT
JOIN
LEFT JOIN
GROUP BY
HAVING
ORDER BY
LIMIT
Aggregate Functions:
SUM()
COUNT()
FORMAT()

▶ How to Run

Open MySQL Workbench or any SQL environment
Copy the SQL script
Execute the script step by step
Run the SELECT queries to view outputs
📸 Example Use Cases

This project can be used for:

SQL practice
Database mini projects
Academic assignments
Portfolio projects
Learning relational databases

🚀 Future Improvements

Possible enhancements:

Add instructors table
Add student login system
Add payment methods
Add course completion tracking
Add stored procedures and triggers
Create views for analytics

👨‍💻 Author

G. Naveen

📄 License

This project is open-source and free to use for educational purpo
