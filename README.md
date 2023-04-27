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

