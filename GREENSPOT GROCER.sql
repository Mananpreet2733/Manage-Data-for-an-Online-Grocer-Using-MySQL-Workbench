-- Create the database GREENPOST_GROCER if it does not exist
CREATE DATABASE IF NOT EXISTS GREENPOST_GROCER;

-- Select the database to use
USE GREENPOST_GROCER;

-- Create the VENDORS table if it does not exist
-- This table stores information about product vendors
CREATE TABLE IF NOT EXISTS VENDORS(
    vendor_id VARCHAR(50) PRIMARY KEY NOT NULL, -- Unique identifier for each vendor
    vendor VARCHAR(250) NOT NULL                -- Vendor name
);

-- Create the PRODUCTS table if it does not exist
-- This table stores information about products
CREATE TABLE IF NOT EXISTS PRODUCTS(
    item_num INT PRIMARY KEY NOT NULL,         -- Unique identifier for each product
    description VARCHAR(250) NOT NULL,         -- Product description
    item_type VARCHAR(50),                     -- Type or category of the product
    unit VARCHAR(50),                          -- Unit of measurement for the product
    vendor_id VARCHAR(50),                     -- Foreign key referencing the vendor supplying the product
    FOREIGN KEY (vendor_id) REFERENCES VENDORS(vendor_id) ON DELETE SET NULL -- Setting the vendor_id to NULL if the vendor is deleted
);

-- Create the INVENTORY table if it does not exist
-- This table tracks the inventory of products
CREATE TABLE IF NOT EXISTS INVENTORY(
    inventory_id INT PRIMARY KEY NOT NULL,     -- Unique identifier for each inventory record
    item_num INT,                              -- Foreign key referencing the product being tracked
    quantity_on_hand INT NOT NULL DEFAULT 0,   -- Quantity of product in stock
    cost DECIMAL(10,2) NOT NULL CHECK (cost >= 0), -- Cost of the product, must be non-negative
    purchase_date DATE,                        -- Date the product was purchased
    location VARCHAR(50),                      -- Location of the inventory
    FOREIGN KEY (item_num) REFERENCES PRODUCTS(item_num) ON DELETE SET NULL -- Setting the item_num to NULL if the product is deleted
);

-- Create the SALES table if it does not exist
-- This table records sales transactions
CREATE TABLE IF NOT EXISTS SALES(
    sale_id VARCHAR(50) PRIMARY KEY NOT NULL,  -- Unique identifier for each sale
    item_num INT,                              -- Foreign key referencing the product being sold
    date_sold DATE,                            -- Date the product was sold
    cust VARCHAR(50),                          -- Customer who bought the product
    quantity INT UNSIGNED NOT NULL DEFAULT 1,  -- Quantity of product sold, must be a positive integer
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0), -- Sale price of the product, must be non-negative
    FOREIGN KEY (item_num) REFERENCES PRODUCTS(item_num) ON DELETE SET NULL -- Setting the item_num to NULL if the product is deleted
);

-- Query to join and fetch data from the tables
-- This query retrieves distinct records with details from PRODUCTS, VENDORS, INVENTORY, and SALES tables
SELECT DISTINCT
    p.item_num, p.description, p.item_type, p.unit,
    v.vendor_id, 
    i.quantity_on_hand, i.cost, i.purchase_date, i.location,
    s.date_sold, s.cust, s.quantity, s.price
FROM 
    PRODUCTS p
    LEFT JOIN VENDORS v ON p.vendor_id = v.vendor_id -- Join PRODUCTS with VENDORS to get vendor details, if any
    INNER JOIN INVENTORY i ON p.item_num = i.item_num -- Join PRODUCTS with INVENTORY to get inventory details
    INNER JOIN SALES s ON p.item_num = s.item_num;   -- Join PRODUCTS with SALES to get sales details
