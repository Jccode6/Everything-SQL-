/***** JOINS!!!! *****/

/*** Joins purpose is to combine data from multiple tables into one
result set. Its a concept that will be used often, maybe every query
in a production environment because its rare that the data required
is in one table. I'll demonstrate an INNER, LEFT join. RIGHT join is
the opposite of the LEFT. Same concept but in reverse.
There's one more called a FULL JOIN which you should NEVER use lol.
I'm not even going to bother to write it but I'll explain what it does
later. ***/

/***** LEFT JOINS *****/

--The left join returns all rows from the left table and matching rows from the right
--The query below returns all customers listed whether they place an order or not and their orderids
--Customer data is in the Customer table an orders data is in the Orders table

SELECT
    C.CompanyName
    ,O.OrderID
FROM
    Customers AS C
--Notice the "AS C" above. I've given the table an alias for readability
LEFT JOIN Orders AS O
--I've invoked the JOIN above by writing LEFT JOIN followed by the table I wish to join to
    ON C.CustomerID = O.CustomerID
ORDER BY O.OrderID
--The left table is the Customer table simply cuz its the first one I listed
--There are diagrams on the internet that show a Venn diagram of LEFT and RIGHT tables that may help
--The INNER JOIN query returned 830 rows. Notice how many records this query returns
--There are two customers who haven't placed orders

/***** INNER JOINS *****/

--The inner join returns only matching rows from table 1 and table 2
--The query below returns Customers who placed orders and their orderid
--Customer data is in the Customer table an orders data is in the Orders table

SELECT
    C.CompanyName
    ,O.OrderID
FROM
    Customers AS C
--Notice the "AS C" above. I've given the table an alias for readability
INNER JOIN Orders AS O
--I've invoked the JOIN above by writing INNER JOIN followed by the table I wish to join to
    ON C.CustomerID = O.CustomerID
--Completing the join by specifying which columns I want to join on. Technically you can join
--On any, but it only makes sense to join on a common column between the two tables
--The alias I mentioned earlier comes into play because you have to tell the database
--Which column from which table you're using. So C.CustomerID means I want to use the
--CustomerID column from the customer table. O.CustomerID is the CustomerID from the Orders table

/**** Full Joins (Yuck) ****/
--A full join would return all rows from the customer table
--And all rows from the orders table no regardless of a match
--For larger databases this will slow down performance.
--I'm sure it serves a purpose, but I've never come accross a scenario where I had to use one.
