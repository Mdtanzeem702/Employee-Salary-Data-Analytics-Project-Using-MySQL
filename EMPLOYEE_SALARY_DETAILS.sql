CREATE DATABASE EMPLOYEE_SALARY_DETAILS;

USE EMPLOYEE_SALARY_DETAILS;

SELECT 
    *
FROM
    SALARIES;


-- 1	Show all columns and rows in the table.

SELECT 
    *
FROM
    SALARIES;

-- 2	Show only the EmployeeName and JobTitle columns.
SELECT 
    EMPLOYEENAME, JOBTITLE
FROM
    SALARIES;

-- 3	Show the number of employees in the table.
SELECT 
    COUNT(*)
FROM
    SALARIES;

-- 4	Show the unique job titles in the table.
SELECT DISTINCT
    JOBTITLE
FROM
    SALARIES;

-- 5	Show the job title and overtime pay for all employees with 
-- overtime pay greater than 50000.

SELECT 
    JOBTITLE, OVERTIMEPAY
FROM
    SALARIES
WHERE
    OVERTIMEPAY > 50000;

-- 6	Show the average base pay for all employees.
SELECT 
    AVG(BASEPAY) AS AVG_BASEPAY
FROM
    SALARIES;

-- 7	Show the top 10 highest paid employees.
SELECT 
    EMPLOYEENAME, TOTALPAY
FROM
    SALARIES
ORDER BY TOTALPAY DESC
LIMIT 10;

-- 8	Show the average of BasePay, OvertimePay, and OtherPay for each employee:
SELECT 
    EMPLOYEENAME,
    (BASEPAY + OVERTIMEPAY + OTHERPAY) / 3 AS AVG_PAY_OF_BP_OP_OTHERPAY
FROM
    SALARIES
ORDER BY AVG_PAY_OF_BP_OP_OTHERPAY DESC
LIMIT 20;

-- 9	Show all employees who have the word "Manager" in their job title.
SELECT 
    EMPLOYEENAME, JOBTITLE
FROM
    SALARIES
WHERE
    JOBTITLE LIKE '%MANAGER%';

-- 10	Show all employees with a job title not equal to "Manager".
SELECT 
    EMPLOYEENAME, JOBTITLE
FROM
    SALARIES
WHERE
    JOBTITLE <> 'MANAGER';

-- 11	Show all employees with a total pay between 50,000 and 75,000.
SELECT 
    *
FROM
    SALARIES
WHERE
    TOTALPAY BETWEEN 50000 AND 75000;

-- OR

SELECT 
    *
FROM
    SALARIES
WHERE
    TOTALPAY > 50000 AND TOTALPAY < 75000;


-- 12	Show all employees with a base pay less than 50,000 
-- or a total pay greater than 100,000.

SELECT 
    *
FROM
    SALARIES
WHERE
    BASEPAY < 50000 OR TOTALPAY > 100000;


-- 13	Show all employees with a total pay benefits value 
-- between 125,000 and 150,000 and a job title containing the word "Director".
SELECT 
    *
FROM
    SALARIES
WHERE
    TotalPayBenefits BETWEEN 125000 AND 150000
        AND JOBTITLE LIKE '%DIRECTOR%';

-- 14	Show all employees ordered by their total pay benefits in descending order.
SELECT 
    *
FROM
    SALARIES
ORDER BY TOTALPAYBENEFITS DESC;

-- 15	Show all job titles with an average base pay of 
-- at least 100,000 and order them by the average base pay in descending order.

SELECT 
    JOBTITLE, AVG(BASEPAY) AS AVG_BASEPAY
FROM
    SALARIES
GROUP BY JOBTITLE
HAVING AVG_BASEPAY >= 100000
ORDER BY AVG_BASEPAY DESC;

-- 16	Delete the column.
SELECT 
    *
FROM
    SALARIES;
    
ALTER TABLE SALARIES
DROP COLUMN NOTES;

#It looks like your MySql session has the safe-updates option set. 
#This means that you can't update or delete records without specifying a key (ex. primary key) in the where clause.
SET SQL_SAFE_UPDATES = 0; 

-- 17	Update the base pay of all employees with 
-- the job title containing "Manager" by increasing it by 10%.
UPDATE SALARIES 
SET 
    BASEPAY = BASEPAY * 1.1
WHERE
    JOBTITLE LIKE '%MANAGER%';

-- 18	Delete all employees who have no OvertimePay.
SELECT 
    COUNT(*)
FROM
    SALARIES
WHERE
    OVERTIMEPAY = 0;

DELETE FROM SALARIES 
WHERE
    OVERTIMEPAY = 0;
