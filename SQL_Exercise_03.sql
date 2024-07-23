use manufacturerdb;

CREATE TABLE Warehouses (
   Code INTEGER NOT NULL,
   Location VARCHAR(255) NOT NULL ,
   Capacity INTEGER NOT NULL,
   PRIMARY KEY (Code)
 );

CREATE TABLE Boxes (
    Code CHAR(4) NOT NULL,
    Contents VARCHAR(255) NOT NULL ,
    Value REAL NOT NULL ,
    Warehouse INTEGER NOT NULL,
    PRIMARY KEY (Code),
    FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
 ) ENGINE=INNODB;
 
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);
 
 -- The Warehouse
-- 3.1 Select all warehouses.

	select * from Warehouses;
 
-- 3.2 Select all boxes with a value larger than $150.

	select * from Boxes where Value > 150;

-- 3.3 Select all distinct contents in all the boxes.

	select distinct * from Boxes;

-- 3.4 Select the average value of all the boxes.

	select avg(Value) as Average_Value from Boxes;

-- 3.5 Select the warehouse code and the average value of the boxes in each warehouse.

	select Warehouses.Code, avg(Boxes.Value) as Average_Value
	from Warehouses left join Boxes
	on Warehouses.Code = Boxes.Warehouse
	group by Warehouses.Code;

-- 3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.

	select Warehouses.Code, avg(Boxes.Value) as Average_Value
	from Warehouses left join Boxes
	on Warehouses.Code = Boxes.Warehouse
	group by Warehouses.Code
    having avg(Boxes.Value) > 150;

-- 3.7 Select the code of each box, along with the name of the city the box is located in.

	select Warehouses.Location, Boxes.Warehouse
	from Warehouses right join Boxes
	on Warehouses.Code = Boxes.Warehouse;

-- 3.8 Select the warehouse codes, along with the number of boxes in each warehouse. 
    -- Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).

	select Warehouses.Code, count(Boxes.Warehouse) as No_of_Boxes
	from Warehouses right join Boxes
	on Warehouses.Code = Boxes.Warehouse
	group by Boxes.Warehouse;

-- 3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
    
    select Warehouses.Code,
	case
		when  count(Boxes.Warehouse) > Warehouses.Capacity then "Saturated"
		else "Not Saturated"
	end as Status
	from Warehouses left join Boxes
	on Warehouses.Code = Boxes.Warehouse
	group by Warehouses.Code;

-- 3.10 Select the codes of all the boxes located in Chicago.

	select Boxes.Code
	from Warehouses right join Boxes
	on Warehouses.Code = Boxes.Warehouse
	where Warehouses.Location = "Chicago";

-- 3.11 Create a new warehouse in New York with a capacity for 3 boxes.

	INSERT INTO Warehouses(Code,Location,Capacity) VALUES(6,"New York",3);

-- 3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.

	INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES("HSRT","Papers",200,2);

-- 3.13 Reduce the value of all boxes by 15%.

	select Code, Contents, Value, Value - (Value * 0.15) as Reduced_Value from Boxes;

-- 3.14 Remove all boxes with a value lower than $100.

	delete from Boxes where Boxes.Value < 100;

-- 3.15 Remove all boxes from saturated warehouses.

	delete from Boxes where Warehouse in(select * from (select Code from Warehouses where Capacity < (select count(*) from Boxes where Warehouse = Warehouses.Code))as delete_Box);
	set sql_safe_updates = 0;

-- 3.16 Add Index for column "Warehouse" in table "boxes"
    -- !!!NOTE!!!: index should NOT be used on small tables in practice

	create index idx_Warehouse on Boxes(Warehouse);

-- 3.17 Print all the existing indexes
    -- !!!NOTE!!!: index should NOT be used on small tables in practice

	show index from Boxes;

-- 3.18 Remove (drop) the index you added just
    -- !!!NOTE!!!: index should NOT be used on small tables in practice

	drop index idx_warehouse on Boxes;
