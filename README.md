# Manage-Data-for-an-Online-Grocer-Using-MySQL-Workbench
GREENSPOT_GROCER Database Project: This project involves the creation of a robust MySQL-based database system for GREENSPOT_GROCER, designed to efficiently manage its data. The database architecture comprises 4 interconnected tables: VENDORS, PRODUCTS, INVENTORY, &amp; SALES, ensuring comprehensive data management &amp; integrity.
GREENSPOT_GROCER Database Project
This project involves the creation of a robust MySQL-based database system for GREENSPOT_GROCER, designed to efficiently manage its vendors, products, inventory, and sales data. The database architecture comprises four interconnected tables: VENDORS, PRODUCTS, INVENTORY, and SALES, ensuring comprehensive data management and integrity.

Key Features
VENDORS Table: Captures essential supplier information, each identified by a unique vendor ID.
PRODUCTS Table: Details each item sold, including its description, type, and unit of measurement. Links each product to its supplier through a foreign key.
INVENTORY Table: Tracks stock levels, costs, purchase dates, and storage locations. References products by their unique item numbers.
SALES Table: Records sales transactions, specifying the product sold, sale date, customer, quantity, and sale price. Maintains a reference to product item numbers.
Data Processing and Cleaning
Python and the pandas library were utilized for initial data preprocessing to ensure consistency and accuracy before insertion into the MySQL database. Key steps included:

Reading and Initial Cleaning: The CSV file containing raw data was read into a pandas DataFrame. Unnecessary rows were removed, and date columns were converted to datetime format.
Data Transformation: Consistent values for cost and price were established for each product, and missing vendor information was inferred based on product descriptions.
Dataframe Creation: Separate DataFrames for vendors, products, inventory, and sales were created, ensuring unique IDs and organized data ready for database insertion.
Saving Processed Data: The cleaned data was saved as CSV files, facilitating easy import into the MySQL database.
Comprehensive Data Integration
The final step involved integrating the processed data into the MySQL database. This structured approach supports complex querying for inventory management and sales analysis, maintaining data integrity and enhancing the overall data management capabilities of GREENSPOT_GROCER.
