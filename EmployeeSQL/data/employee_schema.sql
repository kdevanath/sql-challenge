-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;


CREATE TABLE "titles" (
    "title_id" varchar(256)   NOT NULL,
    "title" varchar(256)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(256)   NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    "birth_date" date   NOT NULL,
    "first_name" varchar(256)   NOT NULL,
    "last_name" varchar(256)   NOT NULL,
    "sex" char   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

DROP TABLE IF EXISTS salaries CASCADE;
CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    "salary" float   NOT NULL
);

DROP TABLE IF EXISTS departments cascade;
CREATE TABLE "departments" (
    "dept_no" varchar(256)   NOT NULL,
    "dept_name" varchar(256)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);
DROP TABLE IF EXISTS dept_manager cascade;
CREATE TABLE "dept_manager" (
    "dept_no" varchar(256)   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    "emp_no" int   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);


DROP TABLE IF EXISTS dept_emp cascade;
CREATE TABLE "dept_emp" (  
	"emp_no" int NOT NULL,	
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	"dept_no" varchar(256) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),    
	PRIMARY KEY (emp_no,dept_no)
);

select * from departments where dept_no = 'd005';
select * from dept_emp;
select * from employees;
select * from titles;
select * from salaries;
select * from departments;
select * from titles;
select * from dept_manager;