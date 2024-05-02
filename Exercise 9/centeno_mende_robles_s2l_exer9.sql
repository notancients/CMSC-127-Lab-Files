
-- Number 1

CREATE TABLE unit (
    unit_name VARCHAR(10),
    unit_full_name VARCHAR(30),
    college_name VARCHAR(5),
    year_established YEAR,
    faculty_count INTEGER DEFAULT 0,
    CONSTRAINT unit_name_pk PRIMARY KEY(unit_name),
    CONSTRAINT college_name_fk FOREIGN KEY(college_name) REFERENCES college(collegename)
);

-- Number 2

-- v1
CREATE TABLE teacher (
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    birthday DATE,
    employee_number VARCHAR(8),
    CONSTRAINT employee_number_pk PRIMARY KEY (
        YEAR(birthday), DAY(birthday), MONTH(birthday) 
    )
);

-- v2
CREATE TABLE teacher (
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    birthday DATE,
    employee_number VARCHAR(8),
    degree VARCHAR(10),
    CONSTRAINT employee_number_pk PRIMARY KEY (employee_number),
    CONTRAINT degree_fk FOREIGN KEY(degree) REFERENCES student(degree)
);

-- v3
CREATE TABLE teacher (
    employee_number VARCHAR(8),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthday DATE,
    degree VARCHAR(50),
    CONSTRAINT pk_teacher PRIMARY KEY (employee_number)
) as
(SELECT 
    CONCAT(YEAR(bday), DAY(bday), MONTH(bday)) AS employee_number,
    s.fname AS first_name,
    s.lname AS last_name,
    s.bday AS birthday,
    s.degree
FROM student s);

-- v4
-- CREATE TABLE teacher AS (
--     SELECT fname, lname, bday, degree, CONCAT(YEAR(bday), DAY(bday), MONTH(bday)) as employee_number
--     from student
--     ),
--     CONSTRAINT employee_number_pk PRIMARY KEY(`employee_number`);

-- Number 3

--
ALTER TABLE teacher CHANGE COLUMN `degree` `unit` VARCHAR(50);

-- Number 4

--
TRUNCATE TABLE teacher;

-- Number 5

--
ALTER TABLE teacher
ADD CONSTRAINT unit_fk FOREIGN KEY(unit) REFERENCES degreeprog(degree);


-- Number 6

--
CREATE VIEW average_units_earned_view(degree, average) AS (SELECT s.degree, AVG(s.unitsearned) FROM student s GROUP BY s.degree);

-- Number 7


-- Number 8


-- Number 9


-- Number 10

