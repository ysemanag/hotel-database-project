/* Domain: Hotel Database DML
 * Author: Yves Semana Gisubizo
 * CPSC 372 - Database Fundamentals Final Project
 * Version: 1.0
 */

-- Sample data for Employees table
INSERT INTO Employees (employee_id, name, username, designation, gender, age, contract_start_date, contract_end_date, home_address) VALUES
  (1, 'John Doe', 'johndoe', 'Manager', 'Male', 40, '2015-10-29', '2021-10-30', '123 Main St, Hartford, CT USA'),
  (2, 'Jane Smith', 'janesmith', 'Assistant Manager', 'Female', 35, '2022-01-01', '2023-01-01', '456 Elm St, Berlin, Germany'),
  (3, 'Bob Johnson', 'bobjohnson', 'Clerk', 'Male', 25, '2022-01-01', '2023-01-01', '789 Oak St, Kigali, Rwanda'),
  (4, 'Alice Lee', 'alicelee', 'Clerk', 'Female', 19, '2020-04-17', '2022-03-07', '34 Musanze St, Musanze, Rwanda'),
  (5, 'David Kim', 'davidkim', 'Stock Manager', 'Male', 29, '2018-11-08', '2023-01-01', '143 Nyaruguru St, Nyamasheke, Rwanda');

-- Sample data for Orders table
INSERT INTO Orders (order_id, product_id, employee_id, cus_id, cus_name, cus_phone, duration, amount) VALUES
  (1, 1, 1, 3,'Frank Chen', '333-444-5555', 5, 100.0),
  (2, 2, 5, 2, 'Ellen Kim', '222-333-4444', 3, 50.0),
  (3, 5, 2, 1, 'Charlie Gray', '345-678-9012', 2, 25.0);

-- Sample data for Inventory table
INSERT INTO Inventory (product_id, quantity, price, supplier_id) VALUES
  (1, 400, 20.0, 1),
  (2, 55, 10.0, 2),
  (3, 320, 5.0, 3),
  (4, 100, 20.0, 2),
  (5, 9, 15.0, 4),
  (6, 700, 50.0, 5);

-- Sample data for Supplier table
INSERT INTO Supplier (supplier_id, name, product_id, phone, address) VALUES
  (1, 'Inkoko Inc.', 1, '555-123-4567', '422 Nyabugogo Ave, Kigali, Rwanda'),
  (2, 'Tura Tugabane Corp.', 2, '555-234-5678', '19 Gatsata St, Kigali, Rwanda'),
  (3, 'Paradise Medal LLC', 3, '555-345-6789', '43 Kicukiro St, Kigali, Rwanda'),
  (4, 'Gisubizo Industries', 5, '555-567-1356', '56 Ndago St, Burera, Rwanda'),
  (5, 'Manaturikumwe Shop', 6, '555-987-0918', '98 Santana St, Rubavu, Rwanda');

-- Sample data for Rooms table
INSERT INTO Rooms (room_id, building, bed_number, availability, price, amenities) VALUES
  (101, 'A', 1, 'TRUE', 50.0, 'TV, Wifi'),
  (104, 'B', 2, 'TRUE', 75.0, 'TV, Wifi, Mini fridge'),
  (210, 'C', 2, 'FALSE', 100.0, 'TV, Wifi, Mini fridge, Microwave'),
  (301, 'B', 2, 'TRUE', 75.0, 'TV, Wifi, Mini fridge'),
  (415, 'B', 2, 'TRUE', 75.0, 'TV, Wifi, Mini fridge');

-- Sample data for Reservations table
INSERT INTO Reservations (reservation_id, reserved_room_id, availability, employee_id, cus_id, cus_name, paid_amount, sign_in_date, sign_out_date)
VALUES
    (1, 101, 'TRUE', 2, 1, 'Charlie Gray', 500.00, '2023-05-01', '2023-05-03'),
    (2, 415, 'TRUE', 1, 3, 'Frank Chen', 750.00, '2023-05-02', '2023-05-05'),
    (3, 210, 'TRUE', 2, 2, 'Ellen Kim', 1000.00, '2023-05-04', '2023-05-08'),
    (4, 104, 'TRUE', 3, 7, 'Enock Niyonkuru', 1250.00, '2023-05-07', '2023-05-10'),
    (5, 101, 'TRUE', 3, 6, 'Semg Dile', 1500.00, '2023-05-09', '2023-05-12'),
    (6, 210, 'TRUE', 2, 7, 'Enock Niyonkuru', 1000.00, '2023-05-07', '2023-05-10'),
    (7, 415, 'TRUE', 3, 7, 'Enock Niyonkuru', 75.00, '2023-05-07', '2023-05-10');

-- Sample data for Payments table
INSERT INTO Payments (payment_id, payer_id, amount, payment_method, reservation_id) VALUES
(1, 3, 100.0, 'Debt Card', 1),
(2, 2, 50.0, 'Cash', 2),
(3, 1, 25.0, 'Debt', 3),
(4, 4, 75.0, 'PayPal', 4),
(5, 5, 200.0, 'Credit Card', 5);

-- Sample data for Debtors table
INSERT INTO Debtors (debt_id, cus_id, cus_name, cus_phone, cus_address, debt_amount, due_date) VALUES
(1, 1, 'Charlie Gray', '345-678-9012', '56 Mbaga St, Nairobi, Kenya', 500.0, '2023-05-01'),
(2, 3, 'Frank Chen', '333-444-5555', '64 Manick St, Texas, USA', 1000.0, '2023-06-15'),
(3, 4, 'Alice Brown', '123-456-7890', '134 Kirambo St, Burera, Rwanda', 250.0, '2023-05-15');


-- Sample data for Customers table
INSERT INTO Customers (cus_id, cus_name, cus_phone, cus_address, comments, freq, debt_amount) VALUES
  (1, 'Charlie Gray', '345-678-9012', '56 Mbaga St, Nairobi, Kenya', 'VIP', 3, 500.0),
  (2, 'Ellen Kim', '222-333-4444', '453 Kimina St, Kigali, Rwanda', NULL, 2, 0.0),
  (3, 'Frank Chen', '333-444-5555', '64 Manick St, Texas, USA', NULL, 1, 1000.0),
  (4, 'Alice Brown', '123-456-7890', '134 Kirambo St, Burera, Rwanda', "FAVORITE FOOD IS UMURETI", 4, 250.0),
  (5, 'Bob Green', '234-567-8901', '3 Moka St, Dodoma, Tanzania', "LOVE THE CUSTOMER CARE", 1, 0.0),
  (6, 'Semg Dile', '234-123-4567', '13 Cheka St, Dodoma, Tanzania', NULL, 1, 0.0),
  (7, 'Enock Niyonkuru', '222-987-0001', '33 Mana St, Kigali, Rwanda', "COMFY BEDS", 1, 0.0),
  (8, 'Lincoln Chapata', '860-576-1456', '300 Summit St, Hartford, USA', NULL, 0, 0.0),
  (9, 'Benny Simoes', '857-109-5637', '345 Johnsat St, Lisbon, Portugal',NULL, 0, 0.0);

-- Sample data for Reports table
INSERT INTO Reports (report_id, report_info, report_date, reporter_id, reporter_name)
VALUES
  (1, 'Monthly Sales Report', '2022-01-01', 1, 'John Doe'),
  (2, 'Quarterly Financial Report', '2022-04-01', 2, 'Jane Smith'),
  (3, 'Yearly Employee Performance Report', '2022-12-31', 3, 'Bob Johnson'),
  (4, 'Customer Feedback Report', '2022-03-15', 1, 'John Doe'),
  (5, 'Marketing Campaign Analysis Report', '2022-09-30', 2, 'Jane Smith'),
  (6, 'Inventory Management Report', '2022-06-30', 5, 'David Kim');
