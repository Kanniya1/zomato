CREATE DATABASE  IF NOT  EXISTS zomato_db;
USE zomato_db;
#table creation:
CREATE TABLE customers ( customer_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100)NOT NULL,
email VARCHAR(100)UNIQUE,
phone VARCHAR(10),
location VARCHAR(100),
singnup_date DATE,
is_premium BOOLEAN DEFAULT FALSE,
preferred_cuisine VARCHAR(50),
total_orders INT DEFAULT 0,
average_rating DECIMAL(3,2) );
#restaurnants

CREATE TABLE restaurants(restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100)NOT NULL,
cuisine_type VARCHAR(100),
location VARCHAR(100),
owner_name VARCHAR(100),
average_delivery_time INT,
contact_number VARCHAR(20),
rating DECIMAL(3,2),
total_orders INT DEFAULT 0,
is_active BOOLEAN DEFAULT TRUE);

#delivery table creation:
 

CREATE TABLE deliivery_persons(delivery_person_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100)NOT NULL,
contact_numbetr VARCHAR(10),
vehicle_type VARCHAR(50),
total_deliveries INT DEFAULT 0,
average_rating DECIMAL (3,2),
location VARCHAR(100));

#order table creation:

CREATE TABLE orders(order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
restaurant_id INT NOT NULL,
order_date DATETIME NOT NULL,
delivery_time DATETIME,

status ENUM('pending','preparing','out for delivery','delivered','cancelled')DEFAULT 'pending',
total_amount DECIMAL(10.2),
payment_mode ENUM('cash','upi','credit card','debit card'),
discount_applied DECIMAL(10,2) DEFAULT 0,
feedback_rating INT CHECK(feedback_rating BETWEEN 1 AND 5),
FOREIGN KEY(customer_id)
REFERENCES customers(customer_id)ON DELETE CASCADE,
FOREIGN KEY(restaurant_id)REFERENCES restaurants(restaurant_id)ON DELETE CASCADE);

#delivery table

CREATE TABLE deliveries(delivery_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
delivery_person_id INT NOT NULL,
delivery_status ENUM('assinged','on the way','delivered','cancelled')DEFAULT'assinged',
distance DECIMAL(5,2),
delivery_time INT,
estimated_time INT,
delivery_fee DECIMAL(8,2),
vehicle_type VARCHAR(20),
FOREIGN KEY(order_id)REFERENCES orders(order_id)ON DELETE CASCADE,
FOREIGN KEY (delivery_person_id)REFERENCES delivery_persons(delivery_person_id)ON DELETE CASCADE);
