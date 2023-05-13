DROP SCHEMA IF EXISTS student_management CASCADE;
CREATE SCHEMA IF NOT EXISTS student_management;

DROP TABLE IF EXISTS student_management.user_login;
CREATE TABLE IF NOT EXISTS student_management.user_login (
	user_id TEXT PRIMARY KEY,
    user_password TEXT,
    first_name TEXT,
	last_name TEXT,
	sign_up_on DATE,
	email_id TEXT
);

DROP TABLE IF EXISTS student_management.parent_details;
CREATE TABLE IF NOT EXISTS student_management.parent_details (
	parent_id TEXT PRIMARY KEY,
    father_first_name TEXT,
	father_last_name TEXT,
	father_email_id TEXT,
	father_mobile TEXT,
	father_occupation TEXT,
	mother_first_name TEXT,
	mother_last_name TEXT,
	mother_email_id TEXT,
	mother_mobile TEXT,
	mother_occupation TEXT
);

DROP TABLE IF EXISTS student_management.teachers;
CREATE TABLE IF NOT EXISTS student_management.teachers (
	teacher_id TEXT PRIMARY KEY,
    first_name TEXT,
	last_name TEXT,
	date_of_birth DATE,
	email_id TEXT,
	contact TEXT,
	registration_date DATE,
	registration_id TEXT UNIQUE
);

DROP TABLE IF EXISTS student_management.class_details;
CREATE TABLE IF NOT EXISTS student_management.class_details (
	class_id TEXT PRIMARY KEY,
    class_teacher TEXT REFERENCES student_management.teachers (teacher_id),
	class_year TEXT
);

DROP TABLE IF EXISTS student_management.student_details;
CREATE TABLE IF NOT EXISTS student_management.student_details (
	student_id TEXT PRIMARY KEY,
    first_name TEXT,
	last_name TEXT,
	date_of_birth DATE,
	class_id TEXT REFERENCES student_management.class_details (class_id),
	roll_no TEXT,
	email_id TEXT,
	parent_id TEXT REFERENCES student_management.parent_details (parent_id),
	registration_date DATE,
	registration_id TEXT UNIQUE
);

DROP TABLE IF EXISTS student_management.subject;
CREATE TABLE IF NOT EXISTS student_management.subject (
	subject_id TEXT PRIMARY KEY,
    subject_name TEXT,
	class_year TEXT,
	subject_head TEXT REFERENCES student_management.teachers (teacher_id)
);

DROP TABLE IF EXISTS student_management.subject_tutors;
CREATE TABLE IF NOT EXISTS student_management.subject_tutors (
	row_id SERIAL PRIMARY KEY,
    subject_id TEXT REFERENCES student_management.subject (subject_id),
	teacher_id TEXT REFERENCES student_management.teachers (teacher_id),
	class_id TEXT REFERENCES student_management.class_details (class_id)
);
