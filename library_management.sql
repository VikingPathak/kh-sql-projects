-- Create Schema
DROP SCHEMA IF EXISTS library_management CASCADE;
CREATE SCHEMA IF NOT EXISTS library_management;

-- User Login Table
DROP TABLE IF EXISTS library_management.user_login;
CREATE TABLE library_management.user_login (
	user_id TEXT PRIMARY KEY,
	user_password TEXT,
	first_name TEXT,
	last_name TEXT,
	sign_up_on DATE,
	email_id TEXT
);

-- Publisher Table
DROP TABLE IF EXISTS library_management.publisher;
CREATE TABLE library_management.publisher (
	publisher_id TEXT PRIMARY KEY,
	publisher TEXT,
	distributor TEXT,
	releases_count INT,
	last_release DATE
);

-- Author Table
DROP TABLE IF EXISTS library_management.author;
CREATE TABLE library_management.author (
	author_id TEXT PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	publications_count INT
);

-- Books Table
DROP TABLE IF EXISTS library_management.books;
CREATE TABLE library_management.books (
	book_id TEXT PRIMARY KEY,
	book_code TEXT,
	book_name TEXT,
	author_id TEXT REFERENCES library_management.author (author_id),
	publisher_id TEXT REFERENCES library_management.publisher (publisher_id),
	book_version TEXT,
	release_date DATE,
	available_from DATE,
	is_available BOOLEAN
);

-- Staff Table
DROP TABLE IF EXISTS library_management.staff;
CREATE TABLE library_management.staff (
	staff_id TEXT PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	staff_role TEXT,
	start_date DATE,
	last_date DATE,
	is_active BOOLEAN,
	work_shift_start TIME,
	work_shift_end TIME
);

-- Readers Table
DROP TABLE IF EXISTS library_management.readers;
CREATE TABLE library_management.readers (
	reader_id TEXT PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	registered_on DATE,
	books_issued_total INT,
	books_issued_current INT,
	is_issued BOOLEAN,
	last_issue_date DATE,
	total_fine FLOAT,
	current_fine FLOAT
);

-- Books Issue Table
DROP TABLE IF EXISTS library_management.books_issue;
CREATE TABLE library_management.books_issue (
	issue_id SERIAL PRIMARY KEY,
	book_id TEXT REFERENCES library_management.books (book_id),
	issued_to TEXT REFERENCES library_management.readers (reader_id),
	issued_on DATE,
	return_on DATE,
	current_fine FLOAT,
	fine_paid BOOLEAN,
	payment_transaction_id TEXT
);

-- Settings Table
DROP TABLE IF EXISTS library_management.settings;
CREATE TABLE library_management.settings (
	book_issue_count_per_reader INT,
	fine_per_day FLOAT,
	book_return_in_days INT
);
