USE Cis111_GuitarShop
--Query 1
Select CategoryName, ProductName, ListPrice
From Categories c
	Join Products p
		on c.CategoryID = p.CategoryID
	Order by CategoryName, ProductName ASC;
--Query 2
Select FirstName, LastName, Line1, City, State, ZipCode
From Customers c
	Join Addresses a
		on c.CustomerID = a.CustomerID
	Where c.EmailAddress = 'allan.sherwood@yahoo.com';
--Query 3
Select FirstName, LastName, Line1, City, State, ZipCode
From Customers c
	Join Addresses a
		on c.ShippingAddressID = a.AddressID
--Query 4
Select LastName, FirstName, OrderDate, ProductName, ItemPrice,
DiscountAmount, Quantity
From Customers c
	Join Orders o
		on c.CustomerID = o.CustomerID
	Join OrderItems oi
		on o.OrderID=oi.OrderID
	Join Products p
		on oi.ProductID = p.ProductID
Order by  LastName, OrderDate, ProductName;
	
--Query 5
Select p1.ProductName, p1.ListPrice 
From Products p1
	Join Products p2
		on p1.ProductID != p2.ProductID
		AND p1.ListPrice = p2.ListPrice
Order by ProductName;

--Query 6
Select c.CategoryName as CategoryName, p.ProductID as ProductID
From Categories c
	Left outer join Products p
		on c.CategoryID = p.CategoryID
	Where ProductID is null;

--Query 7
Select 'SHIPPED' as ShipStatus, OrderID, OrderDate
From Orders
Where ShipDate is not null

UNION

Select 'NOT SHIPPED' as ShipStatus, OrderID, OrderDate
From Orders
Where ShipDate is null
Order by OrderDate;

