-- SET OPERATORS

-- UNION
-- Returns all distinct rows from both queries
-- Removes duplicate rows from the result


/*SELECT
   CustomerID,
   FirstName,
   LastName
   FROM Sales.Customers

UNION

SELECT
   EmployeeID,
   FirstName,
   LastName
   FROM Sales.Employees*/



-- Combine the data from employees and customers into one table

/*SELECT
    FirstName,
	LastName
FROM Sales.Customers 
UNION
SELECT
    FirstName,
	LastName
FROM Sales.Employees */


-- UNION ALL
-- Returns all rows from both queries, including duplicates

-- UNION ALL V/S UNION
--> UNION ALL is generally faster than UNION
--> If you are confident there are no duplicates, use UNION ALL
--> Use UNION ALL to find duplicates and quality issues



-- QUES : Combine the data from employees and customers into one table, including duplicates

/*SELECT 
FirstName,
LastName
FROM Sales.Employees
UNION ALL
SELECT
FirstName,
LastName
FROM Sales.Customers*/



-- EXCEPT
--> Returns all distinct rows from the first query that are not found in the second query
--> It is the only one where the order of queries affects the final results


--QUES : Find the employees who are not customers at the same time

/*SELECT
    FirstName,
	LastName
	FROM Sales.Employees
	EXCEPT
	SELECT
	FirstName,
	LastName
	FROM Sales.Customers*/


-- INTERSECT
--> Returns only the rows that are common in both queries


-- QUES : Find the Employees, who are also customers

/*SELECT
    FirstName,
	LastName
	FROM Sales.Employees
	INTERSECT
SELECT
	FirstName,
	LastName
	FROM Sales.Customers*/




-- QUES : Orders data are sorted in separate table (Orders and OrdersArchieve)
--        Combine all orders data into one report without duplicates

/*SELECT
*
FROM Sales.Orders
UNION 
SELECT
*
FROM Sales.OrdersArchive*/


-- NOTE : Never use an asterisk(*) to combine tables ; list needed columns instead

/*SELECT
'Orders' AS SourceTable,
[OrderID],
[OrderDate],
[ShipDate],
[OrderStatus],
[ShipAddress],
[BillAddress],
[Quantity],
[Sales],
[CreationTime]
FROM Sales.Orders
UNION
SELECT
'OrdersArchive' AS SourceTable,
[OrderID],
[OrderDate],
[ShipDate],
[OrderStatus],
[ShipAddress],
[BillAddress],
[Quantity],
[Sales],
[CreationTime]
FROM Sales.OrdersArchive
ORDER BY OrderID*/


-- EXCEPT : USE CASES
--> DELTA DETECTION : Identify the differences or changes (delta) between two batches of data
--> DATA COMPLETENESS CHECK : EXCEPT operator can be use dto compare tables to detect discrepancies between databases


