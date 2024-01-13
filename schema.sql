-- Item Table
CREATE TABLE Item (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    category VARCHAR(50),
    size INT,
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
    item_id INT,
    location_id INT,
    quantity INT,
    last_updated TIMESTAMP,
    FOREIGN KEY (item_id) REFERENCES Item(item_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);
