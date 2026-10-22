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

    

