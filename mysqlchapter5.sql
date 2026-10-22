/**************
EXERCISE 1: Full Table Backup
Part 1.1) Write a query that determines how many 
records are in the customer table, and document

******************/
SELECT COUNT (*) FROM if26khumn_ap.customers

  
/**************
Part 1.2) Write a statement that creates a complete 
  backup table for the customer table
Name your backup table customer_full_backup

******************/
CREATE TABLE customer_full_backup AS
SELECT *
FROM customer;


/**************
Part 1.3) Write a query that verifies your newly created
backup table has the same number of rows as the
original table
******************/
SELECT *
FROM customer_full_backup

  

/**************
Part 1.4) Use the MySQL CHECKSUM to verify the two tables
are the same
******************/
  
CHECKSUM TABLE customer, customer_full_backup;


/**************
EXERCISE 2: Partial Table Backup
Part 2.1) Write three queries to determine the following:
2.1.A How many records are in the rental table, and documen
******************/
SELECT *
FROM rental 
LIMIT 20000


  
/**************
2.1.B How many rentals have been returned (based on return_date) and document
******************/
SELECT * 
FROM rental 
WHERE return_date <= NOW()
LIMIT 20000


  
/**************
2.1.C How many rentals have NOT been returned (based on return_date), and document
******************/
SELECT * 
FROM rental
WHERE return_date IS NULL
LIMIT 20000

/**************
Part 2.2) Write statements to create a partial backup of the rental table
for all rentals that have been returned. Name your backup table returned_rental
******************/
SELECT * 
FROM rental
WHERE returned_rental
LIMIT 20000


  /**************
EXERCISE 3: Drop Tables
• Write one or two statements that will drop the backup tables from Exercise 1 and 2
******************/
DROP TABLE returned_rental
DROP TABLE customer_full_backup


  /**************
EXERCISE 4: Insert statement WITHOUT a column list
  
• Part 4.1: Write multiple statements to setup yourself as a new customer with a new city and address
o use DEFAULT for auto increment columns
o use NULL for columns that allow null values
o use DEFAULT for columns with default values

  
Steps:
o Insert a new city using country id 103 for United States
Verify that it was created successfully by writing a select filtering on your new city name’s
This should have created city id 601
******************/
INSERT INTO city
    (city_id, city, country_id, last_update)  
VALUES
    (DEFAULT, 'Allen', 103, DEFAULT);  


SELECT * 
FROM city
WHERE city_id = 601

 /**************
Insert a new address - use city id 601 for this new address’s city
Verify that it was created successfully by writing a select filtering on city id 601
This should created address id 606
******************/
INSERT INTO address
   
VALUES
    (DEFAULT, '420 Lincoln St', NULL, 'Nebraska', 601, NULL, '111-222-3333', DEFAULT);  



SELECT * 
FROM address
WHERE city_id= 601

 /**************
Insert a new customer - use address id = 606 for this new customer, and store id = 1
Verify that it was created successfully by writing a select filtering on address id 606
This should create customer id 600
******************/
INSERT INTO customer

VALUES 
	(DEFAULT, 1, 'Debbie', 'Johnson', NULL, 606, 1, current_date(), DEFAULT);




SELECT * 
FROM customer
WHERE customer_id = 600;

/**************
Exercise 5: Insert statement using a column list
• Part 5.1: Write a statement to setup insert another new customer with the same address id 606
o Also use the same last name as the previous insert statement
o OMIT all columns that are auto increment, defaults, and nullable columns
******************/
INSERT INTO customer 
	(customer_id, store_id, first_name, last_name, email, address_id, active, create_date, last_update)
    
VALUES 
	(DEFAULT, 1, 'Sam', 'Johnson', NULL, 606, 1, current_date(), DEFAULT)


/**************
• Part 5.2: Write a query to prove the new customer was created by filtering on address id 606
This should have created customer id = 601
******************/

SELECT * 
FROM customer
WHERE customer_id = 600;

/**************
EXERCISE 6: Update multiple columns for a single record
Note: use book_scripts/ch05/5-05 examples as a starting point
Write the following update statements:
• Part 6.1 - update your first new customer record by changing it's store id = 2 and email address
use the customer id (600) to update only one record
******************/

UPDATE customer
SET store_id = 2, email = 'debbie.johnson@gmail.com'
WHERE customer_id = 60;UPDATE customer

/**************
• Part 6.2 - update your second new customer record by changing it's store id = 2 and email address
use the customer id (601) to update only one record
******************/

SET store_id = 2, email = 'sam.johnson@gmail.com'
WHERE customer_id = 601;

/**************
• Part 6.3 - write a query to verify the two records have been correctly update
use the address id (606) to retrieve both records
******************/

SELECT *
FROM customer
WHERE address_id = 606;


/**************
Exercise 7: Update multiple records (rows)
• Part 7.1: Write one update statement that will update both new customer records
changing their address id from 606 to 605. This will require you filtering by the address id = 606.
******************/

UPDATE customer 
SET address_id = 605
WHERE address_id = 606;

/**************
• Part 7.2: Write a query to verify that both records have been correctly updated by filtering by address id (605)
******************/

SELECT * 
FROM customer 
WHERE address_id = 605;




/*
EXERCISE 8: Write Delete Statements
Part 8.1.A - Write a delete statement that delete the new city records using the city id = 601
*/
DELETE FROM customer
WHERE customer_id IN (600, 601)

/*
Part 8.1.B - Write a delete statement that delete the new address records using the address id = 606
*/

DELETE FROM address
WHERE address_id = 606;

/*
Part 8.1.C - Write a delete statement that delete the new customer records using the customer id = 600 & 601
*/
DELETE FROM city 
WHERE city_id = 601; 


