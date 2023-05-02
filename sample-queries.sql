/* Domain: Hotel Database SQL Queries
 * Author: Yves Semana Gisubizo
 * CPSC 372 - Database Fundamentals Final Project
 * Version: 1.0
 */

/* 1. Retrieve the details of all reservations along with the corresponding customer information, reserved room details, and payment information.*/
SELECT *
  FROM Reservations r
       JOIN
       Customers c ON r.cus_id = c.cus_id
       JOIN
       Rooms rm ON r.reserved_room_id = rm.room_id
       JOIN
       Payments p ON r.reservation_id = p.reservation_id;

/* 2. Retrieve the list of all orders along with the product details, supplier information, and employee details involved in each order:*/SELECT o.order_id, o.product_id, i.quantity, i.price, s.supplier_id, s.name AS supplier_name, s.product AS supplier_product, e.employee_id, e.name AS employee_name, e.designation, e.gender, e.age
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

/* 3. Retrieve the details of all customers who have a debt amount greater than or equal to $100, along with their corresponding reservations, reserved room details, and employee details. */
 SELECT c.cus_id,
        c.cus_name,
        c.cus_phone,
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

/* 4. Retrieve a list of all customers and their associated orders, including customers who have not yet placed any orders. */
SELECT Customers.cus_name,
     Orders.order_id,
     Orders.product_id,
     Orders.amount
FROM Customers
     LEFT JOIN
     Orders ON Customers.cus_id = Orders.cus_id;

/* 5. Retrieve a list of products that have not yet been ordered by any customers, their current inventory levels, and their suppliers. */
SELECT Inventory.product_id,
       Inventory.quantity,
       Supplier.name AS supplier_name
  FROM Inventory
       LEFT JOIN
       Supplier ON Inventory.supplier_id = Supplier.supplier_id
       LEFT JOIN
       Orders ON Inventory.product_id = Orders.product_id
 WHERE Orders.product_id IS NULL;


/*6. Retrieve the total amount of all orders made by each customer. */
SELECT Customers.cus_name,
       SUM(Orders.amount) AS total_orders
  FROM Customers
       INNER JOIN
       Orders ON Customers.cus_id = Orders.cus_id
 GROUP BY Customers.cus_name;

 /* 7. Retrieve the average price and total quantity of all products supplied by each supplier. */
 SELECT Supplier.name,
       AVG(Inventory.price) AS avg_price,
       SUM(Inventory.quantity) AS total_quantity
  FROM Supplier
       INNER JOIN
       Inventory ON Supplier.supplier_id = Inventory.supplier_id
 GROUP BY Supplier.name;

 /* 8. Retrieve the names of all customers who have made at least one order or have booked a room at least once. */
 SELECT cus_name
   FROM Customers
  WHERE cus_id IN (
            SELECT DISTINCT cus_id
              FROM Orders
            UNION
            SELECT DISTINCT cus_id
              FROM Reservations
        );

 /* 9. Retrieve the product IDs and their supplier IDs of all products that have a lower price than the average price of all products. */
 SELECT product_id,
        supplier_id
   FROM Inventory
  WHERE price < (
                    SELECT AVG(price)
                      FROM Inventory
                );

 /* 10. Retrieve the names of all customers who have made at least one order of a product with a quantity greater than 10. */
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

 /* 11. Retrieve the names of all customers who have made orders for products supplied by a supplier with the name ‘Inkoko Inc.’. */
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

 /* 12. Retrieve the names of all customers who have a debt amount greater than the maximum debt amount of any other customer using a self-join. */
 SELECT DISTINCT c1.cus_name
   FROM Customers c1
        JOIN
        Customers c2 ON c1.cus_id <> c2.cus_id AND
                        c1.debt_amount > c2.debt_amount;

 /* 13. List the total number of reservations made by each customer who has made at least 3 reservations. */
 SELECT cus_id,
       cus_name,
       COUNT( * ) AS num_reservations
  FROM Reservations
 GROUP BY cus_id
HAVING COUNT( * ) >= 3;

 /* 14. Find the average price of products for each supplier whose total quantity of products is greater than 500. */
 SELECT Supplier.name,
       AVG(Inventory.price) AS avg_price
  FROM Inventory
       JOIN
       Supplier ON Inventory.supplier_id = Supplier.supplier_id
 GROUP BY Inventory.supplier_id
HAVING SUM(Inventory.quantity) > 500;

 /* 15. List the total amount paid by each customer who has at least one payment greater than $95. */
 SELECT payer_id, SUM(amount) AS total_amount_paid
 FROM Payments
 GROUP BY payer_id
 HAVING MAX(amount) > 95;

 /* 16. Retrieves the employee ID, name and table name that have the same number and order of columns. */
 SELECT employee_id,
        name,
        'employee' AS table_name
   FROM Employees
 UNION ALL
 SELECT cus_id,
        cus_name,
        'customer' AS table_name
   FROM Customers;

/* 17. Finds the product ID values that are both in the Inventory table with a quantity greater than 0 and in the Orders table using INTERSECT set operation. */
SELECT product_id
  FROM Inventory
 WHERE quantity > 0
INTERSECT
SELECT product_id
  FROM Orders;
