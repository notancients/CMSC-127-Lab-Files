
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
ALTER TABLE teacher DROP `birthday`;

-- Number 8

CREATE OR REPLACE VIEW average_units_earned_view(offering_college, degree, average)
AS (SELECT d.offeringcollege, s.degree, AVG(s.unitsearned) FROM student s, degreeprog d
WHERE d.degree = s.degree
GROUP BY s.degree);



-- Number 9

ALTER TABLE unit DROP FOREIGN KEY college_name_fk;
-- Number 10

DROP TABLE unit;