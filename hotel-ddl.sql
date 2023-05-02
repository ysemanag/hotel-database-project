/* Domain: Hotel Database DDL
 * Author: Yves Semana Gisubizo
 * CPSC 372 - Database Fundamentals Final Project
 * Version: 1.0
 */

CREATE TABLE Employees (
  employee_id INT PRIMARY KEY,
  name VARCHAR(50),
  username VARCHAR(50),
  designation VARCHAR(50),
  gender VARCHAR(10),
  age INT,
  contract_start_date DATE,
  contract_end_date DATE,
  street_address VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  country VARCHAR(50),
  zipcode VARCHAR(20)
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  product_id INT,
  employee_id INT,
  cus_id INT,
  cus_name VARCHAR(50),
  cus_phone VARCHAR(20),
  duration INT,
  amount FLOAT,
  FOREIGN KEY (cus_id) REFERENCES Customers(cus_id)
  ON DELETE SET NULL,
  FOREIGN KEY (product_id) REFERENCES Inventory(product_id)
  ON DELETE SET NULL,
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
  ON DELETE SET NULL
);

CREATE TABLE Inventory (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  quantity INT,
  price FLOAT,
  supplier_id INT,
  FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
  ON DELETE SET NULL
);

CREATE TABLE Supplier (
  supplier_id INT PRIMARY KEY,
  name VARCHAR(50),
  product_id VARCHAR(50),
  phone VARCHAR(20),
  street_address VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  country VARCHAR(50),
  zipcode VARCHAR(20)
);

CREATE TABLE Rooms (
  room_id INT PRIMARY KEY,
  building VARCHAR(50),
  bed_number INT,
  availability VARCHAR(10),
  price FLOAT,
  amenities VARCHAR(100)
);

CREATE TABLE Reservations (
  reservation_id INT PRIMARY KEY,
  reserved_room_id INT,
  availability VARCHAR(10) CHECK(availability == "TRUE"),
  employee_id INT,
  cus_id INT,
  cus_name VARCHAR(50),
  paid_amount FLOAT,
  sign_in_date DATE,
  sign_out_date DATE,
  FOREIGN KEY (reserved_room_id) REFERENCES Rooms(room_id)
  ON DELETE SET NULL,
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
  ON DELETE CASCADE,
  FOREIGN KEY (cus_id) REFERENCES Customers(cus_id)
  ON DELETE CASCADE
);

CREATE TABLE Payments (
  payment_id INT PRIMARY KEY,
  payer_id VARCHAR(50),
  amount FLOAT,
  payment_method VARCHAR(50),
  reservation_id INT,
  FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id)
  ON DELETE SET NULL,
  FOREIGN KEY (payer_id) REFERENCES Customers(cus_id)
  ON DELETE SET NULL
);

CREATE TABLE Debtors (
  debt_id INT PRIMARY KEY,
  cus_id INT,
  cus_name VARCHAR(50),
  cus_phone VARCHAR(20),
  debt_amount FLOAT,
  due_date DATE,
  FOREIGN KEY (cus_id) REFERENCES Customers(cus_id)
  ON DELETE CASCADE
);

CREATE TABLE Customers (
  cus_id INT PRIMARY KEY,
  cus_name VARCHAR(50),
  cus_phone VARCHAR(20),
  comments VARCHAR(255),
  freq INT,
  debt_amount FLOAT
);

CREATE TABLE Reports (
  report_id INT PRIMARY KEY,
  report_info VARCHAR(255),
  report_date DATE,
  reporter_id INT,
  reporter_name VARCHAR(50),
  FOREIGN KEY (reporter_id) REFERENCES Employees(employee_id)
  ON DELETE SET NULL
);
