/***** Logic to create table and data to find distance by model *****/


CREATE TABLE "companycars" (
  --Varchar is the data type, 10 is the number of characters the column will hold
    vendor_id varchar(10)
    ,model varchar(10)
)

INSERT INTO "companycars" (vendor_id, model)
--Values will be inserted into the table based on order. Since YCAB is first it will be inserted into the vendor_id column and so forth
VALUES ('YCAB', 'Ford'),
       ('NYC', 'Nissan')

select
    SUM(trip_distance)
from
-- I created an alias for table nyctaxi for readability when creating joins
    "nyctaxi" AS N
inner join "companycars" AS C
/***
When joining two tables you must specify the columns from the appropiate table since both tables have the same columns.
Since I aliased the nyctaxi table as N, any column prefixed with N will represent the nyctaxi table
***/
    ON n.vendor_id = C.vendor_id
-- Where clause acts as a filter to only return rows where the model is equal to Ford
WHERE
    c.model = 'Ford'


/***** Logic to create table and data to find the total number of trips by address *****/
CREATE TABLE "companyaddress" (
  vendor_id varchar(10)
  ,address varchar(10)
);

INSERT INTO "companyaddress" (vendor_id, address)
VALUES ('YCAB','123 Main St'),
       ('NYC', '9876 Wall St')


select
   a.vendor_id
   ,a.address
-- I counted the number of vendor ids in the nyctaxi table because each row represents a different trip
    ,COUNT(n.vendor_id) AS NumofTrips
from
    "companyaddress" AS a
inner join "nyctaxi" AS n
    on a.vendor_id = n.vendor_id
where
-- Here is where I'm filtering to only return rows in the month of April.
    month(n.pickup_datetime) = 4
-- When using any aggreagation you have to group the other columns or it won't work
group by
   a.vendor_id
   ,a.address
