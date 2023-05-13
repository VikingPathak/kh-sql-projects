DROP SCHEMA IF EXISTS online_retail_app CASCADE;
CREATE SCHEMA IF NOT EXISTS online_retail_app;

DROP TABLE IF EXISTS online_retail_app.user_login;
CREATE TABLE IF NOT EXISTS online_retail_app.user_login (
	user_id TEXT PRIMARY KEY,
    user_password TEXT,
    first_name TEXT,
	last_name TEXT,
	sign_up_on DATE,
	email_id TEXT
);

DROP TABLE IF EXISTS online_retail_app.customers;
CREATE TABLE IF NOT EXISTS online_retail_app.customers (
	customer_id TEXT PRIMARY KEY,
    customer_password TEXT,
    first_name TEXT,
	last_name TEXT,
	sign_up_on DATE,
	email_id TEXT,
	contact TEXT,
	last_login TIMESTAMP
);

DROP TABLE IF EXISTS online_retail_app.employment_type;
CREATE TABLE IF NOT EXISTS online_retail_app.employment_type (
	employment_type_id TEXT PRIMARY KEY,
    employment_type TEXT,
	internal_employee BOOLEAN,
    vendor_name TEXT
);

DROP TABLE IF EXISTS online_retail_app.employees;
CREATE TABLE IF NOT EXISTS online_retail_app.employees (
	employee_id TEXT PRIMARY KEY,
    employee_type TEXT REFERENCES online_retail_app.employment_type (employment_type_id),
    first_name TEXT,
	last_name TEXT,
	registered_on DATE,
	email_id TEXT,
	contact TEXT,
	contract_expiry DATE
);

DROP TABLE IF EXISTS online_retail_app.payment;
CREATE TABLE IF NOT EXISTS online_retail_app.payment (
	payment_id TEXT PRIMARY KEY,
    total_amount FLOAT,
    payment_mode TEXT,
	paid_on TIMESTAMP,
	is_success BOOLEAN
);

DROP TABLE IF EXISTS online_retail_app.orders;
CREATE TABLE IF NOT EXISTS online_retail_app.orders (
	order_id TEXT PRIMARY KEY,
    ordered_by TEXT REFERENCES online_retail_app.customers (customer_id),
	payment_id TEXT REFERENCES online_retail_app.payment (payment_id),
	is_delivered BOOLEAN,
	delivery_date DATE,
	delivered_by TEXT REFERENCES online_retail_app.employees (employee_id) 
);

DROP TABLE IF EXISTS online_retail_app.product_items;
CREATE TABLE IF NOT EXISTS online_retail_app.product_items (
	item_id TEXT PRIMARY KEY,
	item_code TEXT,
	item_name TEXT,
	item_type TEXT,
	item_description TEXT,
	item_image JSON,
	sold_by TEXT,
	amount FLOAT,
	discount FLOAT,
	stock_count INT 
);

DROP TABLE IF EXISTS online_retail_app.order_items;
CREATE TABLE IF NOT EXISTS online_retail_app.order_items (
	order_item_id SERIAL PRIMARY KEY,
	item_id TEXT REFERENCES online_retail_app.product_items (item_id),
	order_id TEXT REFERENCES online_retail_app.orders (order_id)
);

DROP TABLE IF EXISTS online_retail_app.order_delivery;
CREATE TABLE IF NOT EXISTS online_retail_app.order_delivery (
	row_id SERIAL PRIMARY KEY,
	order_id TEXT REFERENCES online_retail_app.orders (order_id),
	delivery_stage TEXT
);
