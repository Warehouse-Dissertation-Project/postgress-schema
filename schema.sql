-- Item Table
CREATE TABLE Item (
    item_id VARCHAR(128) PRIMARY KEY,
    item_name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    category VARCHAR(50),
    size INT
    -- Add other item attributes as needed
);

-- Location Table
CREATE TABLE Location (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(255),
    description TEXT,
    capacity INT,
    size_limit INT,
    location_type VARCHAR(50),
    -- Add other location attributes as needed
);

-- Inventory Table
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    item_id VARCHAR(128),
    location_id INT,
    quantity INT,
    last_updated TIMESTAMP,
    FOREIGN KEY (item_id) REFERENCES Item(item_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

-- User Table 
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) UNIQUE NOT NULL,
    admin BOOLEAN NOT NULL DEFAULT FALSE,
    disabled BOOLEAN NOT NULL DEFAULT FALSE
);

-- Order Table
CREATE TABLE "Order" (
                         order_id VARCHAR PRIMARY KEY,
                         user_id VARCHAR,
                         order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         status VARCHAR(50) DEFAULT 'Pending',
                         FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- OrderItem Table
CREATE TABLE OrderItem (
                           order_item_id VARCHAR PRIMARY KEY,
                           order_id VARCHAR,
                           item_id VARCHAR(128),
                           quantity INT,
                           price_per_unit DECIMAL(10, 2),
    -- Add other order item attributes as needed
                           FOREIGN KEY (order_id) REFERENCES "Order"(order_id),
                           FOREIGN KEY (item_id) REFERENCES Item(item_id)
);1

-- Invoice Table
CREATE TABLE Invoice (
                         invoice_id VARCHAR PRIMARY KEY,
                         order_id VARCHAR,
                         user_id VARCHAR,
                         invoice_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         total_amount DECIMAL(10, 2),
    -- Add other invoice attributes as needed
                         FOREIGN KEY (order_id) REFERENCES "Order"(order_id),
                         FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Insert data into Location table
INSERT INTO Location (location_id, location_name, description, capacity, size_limit, location_type)
VALUES (1, 'Location A', 'This is location A', 100, 200, 'Warehouse'),
       (2, 'Location B', 'This is location B', 200, 400, 'Warehouse'),
       (3, 'Location C', 'This is location C', 300, 600, 'Warehouse');

-- Insert data into Item table
INSERT INTO Item (item_id, item_name, description, price, category, size)
VALUES ('12345678901234567890123456789012', 'Brake Pad', 'High quality brake pad', 50.00, 'Brake System', 10),
       ('23456789012345678901234567890123', 'Oil Filter', 'Durable oil filter', 10.00, 'Engine', 2),
       ('34567890123456789012345678901234', 'Spark Plug', 'High performance spark plug', 5.00, 'Engine', 1),
       ('45678901234567890123456789012345', 'Battery', 'Long lasting car battery', 100.00, 'Electrical', 20),
       ('56789012345678901234567890123456', 'Alternator', 'Reliable alternator', 150.00, 'Electrical', 30);


-- Insert data into Inventory table
INSERT INTO Inventory (inventory_id, item_id, location_id, quantity, last_updated)
VALUES (1, '12345678901234567890123456789012', 1, 10, CURRENT_TIMESTAMP),
       (2, '23456789012345678901234567890123', 1, 20, CURRENT_TIMESTAMP),
       (3, '34567890123456789012345678901234', 2, 30, CURRENT_TIMESTAMP),
       (4, '45678901234567890123456789012345', 2, 40, CURRENT_TIMESTAMP),
       (5, '56789012345678901234567890123456', 3, 50, CURRENT_TIMESTAMP);

-- Interst data into Users Table 
INSERT INTO Users (user_id,user_name,user_email)
VALUES ('e465o6vrUAZfi3VZRHtNZv1wjfg2','Louis Stockton','louis.stockton@hotmail.co.uk,true,false)
'
-- Insert data into Order table
INSERT INTO "Order" (user_id, order_date, status)
VALUES ('e465o6vrUAZfi3VZRHtNZv1wjfg2', '2024-02-28 12:00:00', 'Processing'),
       ('e465o6vrUAZfi3VZRHtNZv1wjfg2', '2024-02-28 14:30:00', 'Shipped'),
       ('e465o6vrUAZfi3VZRHtNZv1wjfg2', '2024-02-28 16:45:00', 'Delivered');

-- Insert data into OrderItem table
INSERT INTO OrderItem (order_id, item_id, quantity, price_per_unit)
VALUES (1, '12345678901234567890123456789012', 2, 50.00),
       (1, '23456789012345678901234567890123', 3, 10.00),
       (2, '34567890123456789012345678901234', 1, 5.00),
       (2, '45678901234567890123456789012345', 4, 100.00),
       (3, '56789012345678901234567890123456', 2, 150.00);

-- Insert data into Invoice table
INSERT INTO Invoice (order_id, user_id, total_amount)
VALUES (1, 'e465o6vrUAZfi3VZRHtNZv1wjfg2', 170.00),
       (2, 'e465o6vrUAZfi3VZRHtNZv1wjfg2', 540.00),
       (3, 'e465o6vrUAZfi3VZRHtNZv1wjfg2', 330.00);
