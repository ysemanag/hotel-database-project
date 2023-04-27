# hotel-database-project

TRINITY COLLEGE · DEPARTMENT OF COMPUTER SCIENCE
CPSC 372 Database Fundamentals, Spring 2023
Prof. Jonathan Johnson

Database Project
Yves Semana Gisubizo

Domain Description 

Title: Hotel Database

The Hotel Database is designed to store and manage information related to a typical hotel. This database will include information about the hotel’s employees, transactions, customers, and other relevant operations. 

This database will help in authenticating, storing, and managing a specified hotel business and 


Entities and Relationships 

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
 

Entity-Relationship Diagram 

![er-diagram](https://user-images.githubusercontent.com/111393266/234965340-92e852cc-ae83-4075-85ff-331f3faacdb2.jpeg)

Relational Schema 
 
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


Boyce–Codd Normal Form Decomposition 
Assuming there are no transitive dependencies, here are the functional dependencies from my database with their candidate keys:

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


In all the tables, the non-trivial functional dependencies hold because the tables are designed in such a way that each attribute is fully dependent on the primary key of the table, and there are no non-trivial dependencies between non-key attributes.![image](https://user-images.githubusercontent.com/111393266/234965844-70c71cba-b745-4c5e-a483-6bc64805dbb3.png)


