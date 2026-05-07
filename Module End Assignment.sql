Create database Elearning;

Use Elearning;

CREATE TABLE learners (
    learner_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    unit_price DECIMAL(10,2)
);

CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    learner_id INT,
    course_id INT,
    quantity INT,
    purchase_date DATE,

    FOREIGN KEY (learner_id) REFERENCES learners(learner_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO learners (learner_id, full_name, country) VALUES
(1, 'Aarav Sharma', 'India'),
(2, 'Emily Johnson', 'USA'),
(3, 'Liam Chen', 'China'),
(4, 'Sophia Martinez', 'Spain'),
(5, 'Noah Williams', 'UK');

INSERT INTO courses (course_id, course_name, category, unit_price) VALUES
(101, 'SQL for Beginners', 'Database', 49.99),
(102, 'Advanced Python', 'Programming', 79.99),
(103, 'Data Visualization with Tableau', 'Analytics', 59.99),
(104, 'Machine Learning Basics', 'AI', 89.99),
(105, 'Excel for Business', 'Productivity', 39.99);

INSERT INTO purchases (purchase_id, learner_id, course_id, quantity, purchase_date) VALUES
(1001, 1, 101, 1, '2025-01-15'),
(1002, 2, 102, 1, '2025-02-10'),
(1003, 3, 103, 2, '2025-02-18'),
(1004, 1, 104, 1, '2025-03-05'),
(1005, 4, 105, 3, '2025-03-12'),
(1006, 5, 101, 2, '2025-03-20'),
(1007, 2, 103, 1, '2025-04-02'),
(1008, 3, 102, 1, '2025-04-10');

SELECT 
    course_name,
    FORMAT(unit_price, 2) AS formatted_price
FROM courses;

SELECT 
    course_name AS course,
    unit_price AS price
FROM courses
ORDER by price;

SELECT 
    l.full_name AS learner_name,
    l.country AS country,
    c.course_name AS course,
    c.category AS category,
    p.quantity AS quantity,
    FORMAT(c.unit_price, 2) AS unit_price,
    FORMAT(p.quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date AS purchase_date
FROM purchases p
JOIN learners l 
	ON p.learner_id = l.learner_id
JOIN courses c 
	ON p.course_id = c.course_id
ORDER BY p.purchase_date DESC;

SELECT 
    l.full_name AS learner_name,
    l.country AS country,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_spending
FROM purchases p
JOIN learners l 
	ON p.learner_id = l.learner_id
JOIN courses c 
	ON p.course_id = c.course_id
GROUP BY l.full_name, l.country
ORDER BY learner_name ASC;

SELECT 
    c.course_name AS course_name,
    c.category AS category,
    SUM(p.quantity) AS total_quantity_sold
FROM purchases p
JOIN courses c 
	ON p.course_id = c.course_id
GROUP BY c.course_name, c.category
ORDER BY total_quantity_sold DESC
LIMIT 3;

SELECT 
    c.category AS category,
    FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_revenue,
    COUNT(DISTINCT p.learner_id) AS unique_learners
FROM purchases p
JOIN courses c 
	ON p.course_id = c.course_id
GROUP BY c.category
ORDER BY SUM(p.quantity * c.unit_price) DESC;

SELECT 
    l.learner_id,
    l.full_name AS learner_name,
    l.country AS country,
    COUNT(DISTINCT c.category) AS category_count
FROM purchases p
JOIN learners l 
	ON p.learner_id = l.learner_id
JOIN courses c 
	ON p.course_id = c.course_id
GROUP BY l.learner_id, l.full_name, l.country
HAVING COUNT(DISTINCT c.category) > 1
ORDER BY category_count DESC;

SELECT 
    c.course_id,
    c.course_name AS course_name,
    c.category AS category,
    c.unit_price AS unit_price
FROM courses c
LEFT JOIN purchases p 
	ON c.course_id = p.course_id
WHERE p.course_id IS NULL;

