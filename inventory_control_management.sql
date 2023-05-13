DROP SCHEMA IF EXISTS inventory_control_management CASCADE;
CREATE SCHEMA IF NOT EXISTS inventory_control_management;

DROP TABLE IF EXISTS inventory_control_management.user_login;
CREATE TABLE IF NOT EXISTS inventory_control_management.user_login (
	user_id TEXT PRIMARY KEY,
    user_password TEXT,
    first_name TEXT,
	last_name TEXT,
	sign_up_on DATE,
	email_id TEXT
);

DROP TABLE IF EXISTS inventory_control_management.supplier;
CREATE TABLE IF NOT EXISTS inventory_control_management.supplier (
	supplier_id TEXT PRIMARY KEY,
	supplier_name TEXT,
	address TEXT,
	registered_on DATE
);

DROP TABLE IF EXISTS inventory_control_management.product_items;
CREATE TABLE IF NOT EXISTS inventory_control_management.product_items (
	item_id TEXT PRIMARY KEY,
	item_code TEXT,
	item_name TEXT,
	item_type TEXT,
	item_description TEXT,
	item_image JSON,
	brand_name TEXT,
	supplier_id TEXT REFERENCES inventory_control_management.supplier (supplier_id),
	cost_per_unit FLOAT,
	stock_count INT
);

DROP TABLE IF EXISTS inventory_control_management.purchase_orders;
CREATE TABLE IF NOT EXISTS inventory_control_management.purchase_orders (
	order_id TEXT PRIMARY KEY,
	item_id TEXT REFERENCES inventory_control_management.product_items (item_id),
	supplier_id TEXT REFERENCES inventory_control_management.supplier (supplier_id),
	order_date DATE,
	quantity INT,
	delivery_date DATE,
	is_delivered BOOLEAN,
	payment_id TEXT,
	is_paid BOOLEAN
);
