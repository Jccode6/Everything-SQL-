/***** Queries customers w/ address using CTE *****/

WITH

CTE_Address (ID, Addr1, Addr2, City, State) AS (

    SELECT
        C.CustomerID
        ,C.PostalAddressLine1
        ,C.PostalAddressLine2
        ,CC.CityName
        ,SP.StateProvinceName
    FROM
        Sales.Customers AS C
    INNER JOIN Application.Cities AS CC
        ON C.PostalCityID = CC.CityID
    INNER JOIN Application.StateProvinces AS SP
        ON CC.StateProvinceID = SP.StateProvinceID
)
    SELECT
        Customer.CustomerName
        ,Addr1
        ,Addr2
        ,City
        ,State
    FROM
        CTE_ADDRESS
    INNER JOIN Sales.Customers AS Customer
        ON CTE_ADDRESS.ID = Customer.CustomerID


/***** Returns customers w/ address using a subquery *****/

SELECT
    C.CustomerName
    ,ADDR.AddrLine1
    ,ADDR.AddrLine2
    ,ADDR.City
    ,ADDR.ST
FROM
    Sales.Customers AS C
INNER JOIN (SELECT
        Customer.CustomerID
        ,Customer.PostalAddressLine1 AS AddrLine1
        ,Customer.PostalAddressLine2 AS AddrLine2
        ,Cities.CityName AS City
        ,State.StateProvinceName AS ST
    FROM
        Sales.Customers AS Customer
    INNER JOIN Application.Cities AS Cities
        ON Customer.PostalCityID = Cities.CityID
    INNER JOIN Application.StateProvinces AS State
        ON Cities.StateProvinceID = State.StateProvinceID)ADDR
    ON C.CustomerID = ADDR.CustomerID

/***** Created view to return customers w/ address *****/

CREATE VIEW vCustomerAddress AS

SELECT
    C.CustomerName
    ,C.PostalAddressLine1
    ,C.PostalAddressLine2
    ,City.CityName
    ,S.StateProvinceName
FROM 
    Sales.Customers As C
INNER JOIN Application.Cities AS City
    ON C.PostalCityID = City.CityID
INNER JOIN Application.StateProvinces AS S
    ON City.StateProvinceID = S.StateProvinceID

SELECT * FROM vCustomerAddress
