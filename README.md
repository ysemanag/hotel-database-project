# hotel-database-project

TRINITY COLLEGE · DEPARTMENT OF COMPUTER SCIENCE
CPSC 372 Database Fundamentals, Spring 2023
Prof. Jonathan Johnson

**Database Project
Yves Semana Gisubizo**

**Domain Description 

Title: Hotel Database**

The Hotel Database is designed to store and manage information related to a typical hotel. This database will include information about the hotel’s employees, transactions, customers, and other relevant operations. 

This database will help in authenticating, storing, and managing a specified hotel business and 


**Entities and Relationships** 

The Hotel Database will include several key entities, each of which will be related to one another in various ways. These entities include: 

Employees: This entity will hold all the information regarding the hotel’s employees such as their unique id, name, phone, address, gender, contract start and end date, and more. The employee id and username should be unique for the identification and authentication purposes of each individual employee.

Orders: This entity will contain all the information regarding the orders that take place in the hotel such as the order id, the product being ordered, amount, order duration, the ordering customer info, the employee in charge, and more. It will store all the orders in chronological order with the customer and payments included.


Inventory: This entity will hold information about the hotel's inventory, such as the availability and stock levels of food and beverage items, toiletries, linens, and other amenities.

Suppliers: This entity will contain information about the hotel’s suppliers for the different products or services such as the supplier id, name, phone, address, product and more. 

Rooms: This entity will contain information about the room services of the hotel, including the room number, price, location, number of people, amenities, availability status, and more. Each room will have a unique room number to ensure no double-booking issues of the rooms.

Reservations: This entity will act as the orders entity but for the rooms. It will contain information about the bookings of the rooms such as reservation id, room information, customer information, sign-in and sign-out dates, and more. Every reservation will be assigned a unique reservation id. The room can only be reserved if it’s availability condition is true.

Payments: This entity will hold details about the customer’s payment method, amount, payment history, whether paid or debt and outstanding balances. This entity will be referenced with the unique order numbers to make sure we can identify where every amount has originated.

Debtors: This entity will hold the information regarding customers who have acquired hotel services as a debt such as the debt amount, due date, customer information and more. Every debt will be assigned a unique debt id for identifying the debts easily.

Customers: This entity will contain information about the customers for this hotel such as the customer names, phone numbers, addresses, money owed to the hotel (if any) and more. This relationship will allow the database to store and track who are the hotel’s customers and link them to their order information. This data will also be used to analyze what are the hotel’s most frequent customers, orders, etc.

Reports: This entity will contain information about different reports generated automatically or manually for different causes, including report id, report information, and reporting employee’s information such as the employee id and name. It will use a unique report id to be able to identify every report individually.
 


**Entity-Relationship Diagram **

![er-diagram](https://user-images.githubusercontent.com/111393266/234965340-92e852cc-ae83-4075-85ff-331f3faacdb2.jpeg)



**Relational Schema **
 
Employees (employee_id, name, username, designation, gender, age, contract_start_date, contract_end_date,home_address )
Orders (order_id, product_id, employee_id, cus_id, cus_name, cus_phone, duration, amount)
Inventory (product_id, quantity, price, supplier_id)
Supplier (supplier_id, name, product_id, phone, address)
Rooms (room_id, building, bed_number, availability, price, amenities)
Reservations (reservation_id, reserved_room_id, availability, cus_id, cus_name, paid_amount, sign_in_date, sign_out_date)
Payments (payment_id, payer, amount, payment_method)
Debtors (debt_id, cus_id, cus_name, cus_phone, cus_address, debt_amount, due_date)
Customers (cus_id, cus_name, cus_phone, cus_address, comments, freq, debt_amount)
Reports (report_id, report_info, report_date, reporter_id, reporter_name)



**Boyce–Codd Normal Form Decomposition** 

1.	Employees (employee_id, name, username, gender, age, contract_start_date, contract_end_date, home_address)

Non-trivial functional dependencies:
employee_id -> name, username, gender, age, contract_start_date, contract_end_date, home_address
username -> employee_id, name, gender, age, contract_start_date, contract_end_date, home_address

Result: Yes, it is in BCNF. All the attributes on the right side of the dependency are fully dependent on the primary key (employee_id), and username is also a superkey (employees cannot share a username)

2.	Orders (order_id, product_id, employee_id, cus_id, cus_name, cus_phone, duration, amount)

Non-trivial functional dependencies:
order_id -> product_id, employee_id, cus_id, cus_name, cus_phone, duration, amount

Result: Yes, it is in BCNF because order_id is a super key. 

3.	Inventory (product_id, quantity, price, supplier_id)

Non-trivial functional dependencies:
product_id -> quantity, price, supplier_id

Result: Yes, it is in BCNF because product_id is a super key.

4.	Supplier (supplier_id, supplier_name, supplier_phone, supplier_address)

Non-trivial functional dependencies:
supplier_id -> supplier_name, supplier_phone, supplier_address

Result: Yes, it is in BCNF because supplier_id is a super key.

5.	Rooms (room_id, building, bed_number, availability, price, amenities)

Non-trivial functional dependencies:
room_id -> building, bed_number, availability, price, amenities

Result: Yes, it is in BCNF because room_id is a super key.

6.	Reservations (reservation_id, reserved_room_id, availability, cus_id, cus_name, paid_amount, sign_in_date, sign_out_date)

Non-trivial functional dependencies:
reservation_id -> reserved_room_id, availability, cus_id, cus_name, paid_amount, sign_in_date, sign_out_date

Result: Yes, it is in BCNF because reservation_id is a super key.

7.	Payments (payment_id, payer, amount, payment_method)

Non-trivial functional dependencies:
payment_id -> payer, amount, payment_method

Result: Yes, it is in BCNF because payment_id is a super key.

8.	Debtors (debt_id, cus_id, cus_name, cus_phone, cus_address, debt_amount, due_date)

Non-trivial functional dependencies:
debt_id -> cus_id, cus_name, cus_phone, cus_address, debt_amount, due_date
cus_id -> cus_name, cus_phone, cus_address, debt_amount, due_date

Result: Yes, it is BCNF. All the attributes on the right side of the dependencies are fully dependent on the primary keys (debt_id and cus_id)

9.	Customers (cus_id, cus_name, cus_phone, cus_address, comments, freq, debt_amount)

Non-trivial functional dependencies:
cus_id -> cus_name, cus_phone, cus_address, comments, freq, debt_amount

Result: Yes, it is in BCNF because cus_id is a super key.

10.	Reports (report_id, report_info, report_date, reporter_id, reporter_name)

Non-trivial functional dependencies:
report_id -> report_info, report_date, reporter_id, reporter_name

Result: Yes, it is in BCNF because report_id is a super key.


In all the tables, the non-trivial functional dependencies hold because the tables are designed in such a way that each attribute is fully dependent on the primary key of the table, and there are no non-trivial dependencies between non-key attributes.


**Transaction and Query Executions **
(All the queries below can also be found in a single SQL file named _sample-quieries.sql_)

//At least two queries should involve four or more relations 

QUERY 1

Query description: 
Retrieve the details of all reservations along with the corresponding customer information, reserved room details, and payment information.

Query:
SELECT *
  FROM Reservations r
       JOIN
       Customers c ON r.cus_id = c.cus_id
       JOIN
       Rooms rm ON r.reserved_room_id = rm.room_id
       JOIN
       Payments p ON r.reservation_id = p.reservation_id;

Intended result set:
The intended result is a list of all reservations along with the corresponding customer name, phone number, address, reserved room building, bed number, price, and amenities, and payment details such as the payer, amount paid, and payment method.
![1](https://user-images.githubusercontent.com/111393266/234967137-2bcf8d6f-82e2-4a79-a8be-859d9f230b03.png)


QUERY 2

Query description: 
Retrieve the list of all orders along with the product details, supplier information, and employee details involved in each order.

Query:
SELECT o.order_id,
       o.product_id,
       i.quantity,
       i.price,
       s.supplier_id,
       s.name AS supplier_name,
       s.product_id AS supplier_product,
       e.employee_id,
       e.name AS employee_name,
       e.designation,
       e.gender,
       e.age
  FROM orders o
       JOIN
       Inventory i ON o.product_id = i.product_id
       JOIN
       Supplier s ON i.supplier_id = s.supplier_id
       JOIN
       Employees e ON o.employee_id = e.employee_id;
 
Intended result set:
The intended result is a list of all orders along with the corresponding product quantity and price, supplier ID, name, and product, and employee ID, name, designation, gender, and age.
![2](https://user-images.githubusercontent.com/111393266/234967492-c9772a6d-b735-4d38-be61-25c56aef2b5d.png)


QUERY 3

Query description: 
Retrieve the details of all customers who have a debt amount greater than or equal to $100, along with their corresponding reservations, reserved room details, and employee details.

Query:
SELECT c.cus_id,
        c.cus_name,
        c.cus_phone,
        c.cus_address,
        c.comments,
        c.freq,
        c.debt_amount,
        r.reservation_id,
        r.reserved_room_id,
        r.availability,
        r.paid_amount,
        r.sign_in_date,
        r.sign_out_date,
        rm.building,
        rm.bed_number,
        rm.price,
        rm.amenities,
        e.employee_id,
        e.name AS employee_name,
        e.designation,
        e.gender,
        e.age
   FROM Customers c
        JOIN
        Reservations r ON c.cus_id = r.cus_id
        JOIN
        Rooms rm ON r.reserved_room_id = rm.room_id
        JOIN
        Employees e ON r.employee_id = e.employee_id
  WHERE c.debt_amount >= 100;
  
Intended result set:
The intended result is a list of all such customers with a debt amount greater than 100 along with their corresponding reservation ID, reserved room building, bed number, price, and amenities, and employee details such as ID, name, designation, gender, and age.
![3](https://user-images.githubusercontent.com/111393266/234967862-8835c23b-50c6-40a2-a0f2-e355061f374e.png)


//At least one query should involve outer joins 

QUERY 4

Query description: 
Retrieve a list of all customers and their associated orders, including customers who have not yet placed any orders.

Query:
SELECT Customers.cus_name,
     Orders.order_id,
     Orders.product_id,
     Orders.amount
FROM Customers
     LEFT JOIN
     Orders ON Customers.cus_id = Orders.cus_id;
     
Intended result set:
This query uses a LEFT OUTER JOIN to join the Customers and Orders tables. The result will include all customers, even those who haven't placed any orders yet. If a customer doesn't have any orders, the fields from the Orders table will be NULL.
![4](https://user-images.githubusercontent.com/111393266/234968057-bbcd2547-365f-463c-a188-117a36822ddf.png)


QUERY 5

Query description: 
Retrieve a list of products that have not yet been ordered by any customers, their current inventory levels, and their suppliers.

Query:
SELECT Inventory.product_id,
       Inventory.quantity,
       Supplier.name AS supplier_name
  FROM Inventory
       LEFT JOIN
       Supplier ON Inventory.supplier_id = Supplier.supplier_id
       LEFT JOIN
       Orders ON Inventory.product_id = Orders.product_id
 WHERE Orders.product_id IS NULL;
 
Intended result set:
This query uses a LEFT OUTER JOIN to join the Inventory and Supplier tables, and another LEFT OUTER JOIN to join the Orders table. The WHERE clause filters out products that have been ordered by customers, so the result will include all products that haven't been ordered yet. For those products, the fields from the Orders table will be NULL.
![5](https://user-images.githubusercontent.com/111393266/234968220-31bea7fe-ffd9-4491-b34f-e4d73b3241de.png)


//At least one query should use an aggregate function 

QUERY 6

Query description: 
Retrieve the total amount of all orders made by each customer.

Query:
SELECT Customers.cus_name,
       SUM(Orders.amount) AS total_orders
  FROM Customers
       INNER JOIN
       Orders ON Customers.cus_id = Orders.cus_id
 GROUP BY Customers.cus_name;
 
Intended result set:
This query uses the SUM() aggregate function to calculate the total amount of all orders made by each customer. It then groups the results by customer name, so the output will include one row for each customer, with their name and the total amount of their orders.
![6](https://user-images.githubusercontent.com/111393266/234968356-0ce6d785-1280-49ac-b781-3bc2ddd1b1d4.png)


QUERY 7

Query description: 
Retrieve the average price and total quantity of all products supplied by each supplier.

Query:
 SELECT Supplier.name,
       AVG(Inventory.price) AS avg_price,
       SUM(Inventory.quantity) AS total_quantity
  FROM Supplier
       INNER JOIN
       Inventory ON Supplier.supplier_id = Inventory.supplier_id
 GROUP BY Supplier.name;
   
Intended result set:
This query uses the AVG() and SUM() aggregate functions to calculate the average price and total quantity of all products supplied by each supplier. It then groups the results by supplier name, so the output will include one row for each supplier, with their name, the average price of their products, and the total quantity of their products.
![7](https://user-images.githubusercontent.com/111393266/234968598-276cd2e1-8d5a-4287-a60c-9f8542aa7383.png)


//At least three queries should use subqueries in a non-trivial way
-	//One of those should use a set comparison (e.g. > some ) 

QUERY 8

Query description: 
Retrieve the names of all customers who have made at least one order or have booked a room at least once.

Query:
SELECT cus_name
  FROM Customers
 WHERE cus_id IN (
           SELECT DISTINCT cus_id
             FROM Orders
           UNION
           SELECT DISTINCT cus_id
             FROM Reservations
       );

Intended result set:
This query uses a subquery to find all distinct customer IDs that appear in the Orders table or the Reservations table. It then selects the names of all customers whose IDs are in that list. The intended result is a list of customer names who have made at least one order or booked one room.
![8](https://user-images.githubusercontent.com/111393266/234968891-45554f0d-1bde-4e2d-94c1-f021826e405d.png)


QUERY 9

Query description: 
Retrieve the product IDs and their suppliers' IDs of all products that have a lower price than the average price of all products.

Query:
SELECT product_id,
       supplier_id
  FROM Inventory
 WHERE price < (
                   SELECT AVG(price)
                     FROM Inventory
               );
 
Intended result set:
This query uses a subquery to calculate the average price of all products in the Inventory table. It then selects the product IDs and their suppliers’ IDs of all products whose price is lower than that average. The intended result is a list of products with below-average prices.
![9](https://user-images.githubusercontent.com/111393266/234969109-960e4a78-8571-4d28-9bd0-8573852d0811.png)


QUERY 10

Query description: 
Retrieve the names of all customers who have made at least one order of a product with a quantity greater than 10.

Query:
SELECT cus_name
  FROM Customers
 WHERE cus_id IN (
           SELECT DISTINCT cus_id
             FROM Orders
            WHERE product_id IN (
                      SELECT product_id
                        FROM Inventory
                       WHERE quantity > 10
                  )
       );
       
Intended result set:
This query uses two subqueries to find all distinct customer IDs that have made an order for a product with a quantity greater than 10. It then selects the names of all customers whose IDs are in that list. The intended result is a list of customer names who have made at least one order of a high-quantity product.
![10](https://user-images.githubusercontent.com/111393266/234969238-47c5a433-59cc-4d38-ae62-2af5a18e6360.png)


QUERY 11

Query description: 
Retrieve the names of all customers who have made orders for products supplied by a supplier with the name ‘Inkoko Inc.’.

Query:
SELECT cus_name
  FROM Customers
 WHERE cus_id IN (
           SELECT DISTINCT cus_id
             FROM Orders
            WHERE product_id IN (
                      SELECT product_id
                        FROM Inventory
                       WHERE supplier_id = (
                                               SELECT supplier_id
                                                 FROM Supplier
                                                WHERE name = 'Inkoko Inc.'
                                           )
                  )
       );
       
Intended result set:
This query uses three subqueries to find all distinct customer IDs that have made an order for a product supplied by a supplier with the name 'Inkoko Inc.'. It then selects the names of all customers whose IDs are in that list. The intended result is a list of customer names who have made orders for products supplied by that particular supplier.
![11](https://user-images.githubusercontent.com/111393266/234969495-b4abfe2f-ce9f-45f7-81ba-9edb88e8e01f.png)


QUERY 12

Query description: 
Retrieve the names of all customers who have a debt amount greater than the maximum debt amount of any other customer using a self-join.

Query:
SELECT DISTINCT c1.cus_name
   FROM Customers c1
        JOIN
        Customers c2 ON c1.cus_id <> c2.cus_id AND
                        c1.debt_amount > c2.debt_amount;
               
Intended result set:
This query uses a self-join to compare each customer's debt amount with the debt amount of all other customers. We join the Customers table with itself on the condition that the cus_id of one row is not equal to the cus_id of the other row, and the debt_amount of the first row is greater than the debt_amount of the second row. We then select only the distinct cus_name values from the first row. The intended result is a list of customer names with the highest debt amount in the table.
![12](https://user-images.githubusercontent.com/111393266/234969713-dd2f08cd-5eb9-420d-babe-6aab88d0af6f.png)


//At least two queries should use grouping 
-	//At least one of those should use having 

QUERY 13

Query description:
List the total number of reservations made by each customer who has made at least 3 reservations.

Query:
SELECT cus_id,
       cus_name,
       COUNT( * ) AS num_reservations
  FROM Reservations
 GROUP BY cus_id
HAVING COUNT( * ) >= 3;

Intended result set:
This query first groups the reservations table by the customer ID, name, and counts the number of reservations for each customer. The HAVING clause filters the result to only include customers with at least 3 reservations. The output shows the customer ID and the total number of reservations for each qualifying customer.
![13](https://user-images.githubusercontent.com/111393266/234969844-dc0523b6-9795-487d-bc3f-04a5fe3e841c.png)


QUERY 14

Query description:
Find the average price of products for each supplier whose total quantity of products is greater than 500.

Query:
SELECT Supplier.name,
       AVG(Inventory.price) AS avg_price
  FROM Inventory
       JOIN
       Supplier ON Inventory.supplier_id = Supplier.supplier_id
 GROUP BY Inventory.supplier_id
HAVING SUM(Inventory.quantity) > 500;

Intended result set:
This query joins the Inventory and Supplier tables on the supplier ID and groups the result by supplier ID. The HAVING clause filters the result to only include suppliers with a total quantity of products greater than 500. The output shows the supplier name and the average price of products for each qualifying supplier.
![14](https://user-images.githubusercontent.com/111393266/234969970-03301878-478e-4e6e-bcf6-3e9a933450eb.png)


QUERY 15

Query description:
List the total amount paid by each customer who has at least one payment greater than $95.

Query:
SELECT payer_id, SUM(amount) AS total_amount_paid
 FROM Payments
 GROUP BY payer_id
 HAVING MAX(amount) > 95;
 
Intended result set:
This query groups the Payments table by customer ID and sums up the amount paid by each customer. The HAVING clause filters the result to only include customers who have made at least one payment greater than $95. The output shows the customer ID and the total amount paid by each qualifying customer.
![15](https://user-images.githubusercontent.com/111393266/234970111-8dec4910-5360-4d10-8173-29bf6ee7dd32.png)


//At least one query should use set operations

QUERY 16

Query description:
Retrieves the employee ID, name and table name that have the same number and order of columns.

Query:
SELECT employee_id,
        name,
        'employee' AS table_name
   FROM Employees
 UNION ALL
 SELECT cus_id,
        cus_name,
        'customer' AS table_name
   FROM Customers;

Intended result set:
This query uses the UNION ALL set operation to combine the results of two SELECT statements that have the same number and order of columns. The result set of this query is a combination of all rows from the two tables, including duplicates if any.
![16](https://user-images.githubusercontent.com/111393266/234970253-72f3629a-73c6-4f9e-b891-8152fb1d4c64.png)


QUERY 17

Query description:
Finds the product ID values that are both in the Inventory table with a quantity greater than 0 and in the Orders table using INTERSECT set operation.

Query:
SELECT product_id
  FROM Inventory
 WHERE quantity > 0
INTERSECT
SELECT product_id
  FROM Orders;

Intended result set:
The result set of this query is a list of product ID values that are in both tables.
![17](https://user-images.githubusercontent.com/111393266/234970388-daa678b2-14be-4ef6-995b-fce94bd5833e.png)


-------- THE END!! --------
