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
