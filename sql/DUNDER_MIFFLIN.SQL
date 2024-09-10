-- Create the product_categories table
CREATE TABLE product_categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(255),
  category_description TEXT
);

-- Create the suppliers table
CREATE TABLE suppliers (
  supplier_id INT AUTO_INCREMENT PRIMARY KEY,
  supplier_name VARCHAR(255),
  supplier_contact VARCHAR(255),
  supplier_addr_street VARCHAR(255),
  supplier_addr_city VARCHAR(255),
  supplier_addr_postcode VARCHAR(255),
  supplier_addr_country VARCHAR(255),
  supplier_phone VARCHAR(255)
);

-- Create the products table
CREATE TABLE products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(255),
  supplier_id INT,
  category_id INT,
  unit_detail TEXT,
  price DECIMAL(10, 2),
  CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
  CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES product_categories(category_id)
);

-- Create the shippers table
CREATE TABLE shippers (
  shipper_id INT AUTO_INCREMENT PRIMARY KEY,
  shipper_name VARCHAR(255),
  shipper_phone VARCHAR(255)
);

-- Create the customers table
CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(255),
  customer_contact VARCHAR(255),
  customer_addr_street VARCHAR(255),
  customer_addr_city VARCHAR(255),
  customer_addr_postcode VARCHAR(255),
  customer_addr_country VARCHAR(255)
);

-- Create the employees table
CREATE TABLE employees (
  emp_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_lastname VARCHAR(255),
  emp_firstname VARCHAR(255),
  emp_birthdate DATE,
  emp_photo VARCHAR(255),
  emp_notes TEXT
);

-- Create the orders table
CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  emp_id INT,
  order_date DATE,
  shipper_id INT,
  CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  CONSTRAINT fk_employee FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
  CONSTRAINT fk_shipper FOREIGN KEY (shipper_id) REFERENCES shippers(shipper_id)
);

-- Create the order_detail table
CREATE TABLE order_details (
  order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
  CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);
