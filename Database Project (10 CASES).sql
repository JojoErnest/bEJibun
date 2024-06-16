USE bEJibun
GO

-- Case 1
SELECT 
ItemName, 
ItemPrice, 
[Item Total] = SUM(ItemQuantity)
FROM Items i
JOIN PurchaseOrders po ON i.ItemId = po.ItemId
JOIN PurchaseTransactions pt ON po.PurchaseTransactionId = pt.PurchaseTransactionId
WHERE ArrivalDate IS NULL
GROUP BY i.ItemId, ItemName, ItemPrice
HAVING SUM(ItemQuantity) > 100
ORDER BY [Item Total] DESC

-- Case 2
SELECT 
VendorName, 
[Domain Name] = RIGHT(VendorEmail, CHARINDEX('@', REVERSE(VendorEmail)) - 1),
[Average Purchased Item] = AVG(ItemQuantity)
FROM Vendors v
JOIN PurchaseTransactions pt ON v.VendorId = pt.VendorId
JOIN PurchaseOrders po ON pt.PurchaseTransactionId = po.PurchaseTransactionId
WHERE VendorAddress LIKE 'Food Street' 
AND RIGHT(VendorEmail, CHARINDEX('@', REVERSE(VendorEmail)) - 1) NOT LIKE 'gmail.com'
GROUP BY v.VendorId, VendorName, VendorEmail

-- Case 3
SELECT 
[Month] = MONTH(tDate),
[Minimum Quantity Sold] = MIN(a.total),
[Maximum Quantity Sold] = MAX(a.total)
FROM
(
	SELECT st.SalesTransactionId, SUM(ItemQuantity) AS [total], SalesDate AS [tDate]
	FROM SalesTransactions st
	JOIN CustomerOrders co ON st.SalesTransactionId = co.SalesTransactionId
	JOIN Items i ON co.ItemId = i.ItemId
	JOIN ItemTypes it ON i.ItemTypeId = it.ItemTypeId
	WHERE YEAR(st.SalesDate) = 2019 
	AND ItemTypeName NOT IN ('Food','Drink')
	GROUP BY st.SalesTransactionId, SalesDate
) AS a
GROUP BY MONTH(tDate)

-- Case 4
SELECT
[Staff Number] = STUFF(s.StaffId, 1, 2, 'Staff'),
StaffName,
[Salary] = CONCAT('Rp.', StaffSalary),
[Sales Count] = COUNT(DISTINCT st.SalesTransactionId),
[Average Sales Quantity] = SUM(ItemQuantity) / COUNT(DISTINCT st.SalesTransactionId)
FROM Staffs s
JOIN SalesTransactions st ON s.StaffId = st.StaffId
JOIN CustomerOrders co ON st.SalesTransactionId = co.SalesTransactionId
JOIN Customers c ON st.CustomerId = c.CustomerId
WHERE MONTH(SalesDate) = 2
AND StaffGender NOT LIKE CustomerGender
GROUP BY s.StaffId, s.StaffName, s.StaffSalary

-- 5
SELECT
[Customer Initial] = CONCAT(LEFT(CustomerName, 1), RIGHT(CustomerName, 1)),
[Transaction Date] = CONVERT(VARCHAR, SalesDate, 107),
[Sales Quantity] = SUM(ItemQuantity)
FROM SalesTransactions st
JOIN Customers c ON st.CustomerId = c.CustomerId
JOIN CustomerOrders co ON st.SalesTransactionId = co.SalesTransactionId,
(
	SELECT SUM(ItemQuantity) / COUNT(DISTINCT SalesTransactionId) AS average
	FROM CustomerOrders
) AS a
WHERE CustomerGender LIKE 'Female'
GROUP BY CustomerName, SalesDate, st.SalesTransactionId, a.average
HAVING SUM(ItemQuantity) > a.average

-- 6
SELECT
[ID] = LOWER(pt.VendorId),
VendorName,
[Phone Number] = STUFF(VendorPhone, 1, 1, '+62')
FROM PurchaseTransactions pt
JOIN Vendors v ON pt.VendorId = v.VendorId
JOIN PurchaseOrders po ON pt.PurchaseTransactionId = po.PurchaseTransactionId,
(
	SELECT SUM(ItemQuantity) AS qty
	FROM PurchaseOrders
	GROUP BY PurchaseTransactionid 
) AS a
WHERE CAST(RIGHT(ItemId, 3) AS INT) % 2 != 0
GROUP BY pt.PurchaseTransactionid, pt.VendorId, VendorName, VendorPhone 
HAVING SUM(ItemQuantity) > MIN(qty)

-- 7
SELECT 
StaffName, 
VendorName, 
[PurchaseID] = pt.PurchaseTransactionId,
[Total Purchased Quantity] = SUM(ItemQuantity),
[Ordered Day] = CONCAT(DATEDIFF(DAY, PurchaseDate, GETDATE()), ' Days ago')
FROM PurchaseTransactions pt
JOIN Staffs s ON pt.StaffId = s.StaffId
JOIN Vendors v ON pt.VendorId = v.VendorId
JOIN PurchaseOrders po ON pt.PurchaseTransactionId = po.PurchaseTransactionId,
(
	SELECT MAX(qty) AS maxQty
	FROM
	(
		SELECT SUM(ItemQuantity) AS qty
		FROM PurchaseOrders po
		JOIN PurchaseTransactions pt ON po.PurchaseTransactionId = pt.PurchaseTransactionId
		WHERE DATEDIFF(DAY, PurchaseDate, ArrivalDate) < 7
		GROUP BY po.PurchaseTransactionId
	) AS b
) AS a
GROUP BY StaffName, VendorName, pt.PurchaseTransactionId, PurchaseDate, maxQty
HAVING SUM(ItemQuantity) > maxQty

-- 8
SELECT TOP (2)
[Day] = DATENAME(WEEKDAY, SalesDate),
[Item Sales Amount] = COUNT(co.ItemId)
FROM SalesTransactions st
JOIN CustomerOrders co ON st.SalesTransactionId = co.SalesTransactionId
JOIN Items i ON co.ItemId = i.ItemId,
(
	SELECT AVG(ItemPrice) AS average
	FROM Items i
	JOIN ItemTypes it ON i.ItemTypeId = it.ItemTypeId
	WHERE ItemTypeName IN ('Electronic','Gadgets')
) AS a
WHERE ItemPrice < average
GROUP BY st.SalesTransactionId, SalesDate
ORDER BY [Item Sales Amount]

-- 9
CREATE VIEW [Customer Statistic by Gender] AS
SELECT 
[CustomerGender] = a.gender,
[Maximum Sales] = MAX(a.Qty),
[Minimum Sales] = MIN(a.Qty)
FROM
(
	SELECT CustomerGender AS gender,
	SUM(ItemQuantity) AS Qty
	FROM SalesTransactions st
	JOIN CustomerOrders co ON st.SalesTransactionId = co.SalesTransactionId
	JOIN Customers c ON st.CustomerId = c.CustomerId
	WHERE YEAR(CustomerDOB) BETWEEN 1998 AND 1999
	GROUP BY st.SalesTransactionId, CustomerGender
	HAVING SUM(ItemQuantity) BETWEEN 10 AND 50
) AS a
GROUP BY a.gender


-- 10
CREATE VIEW [Item Type Statistic] AS
SELECT
[Item Type] = UPPER(ID),
[Average Price] = AVG(price),
[Number of Item Variety] = COUNT(ID)
FROM
(
	SELECT 
	[ID] = ItemTypeName,
	[price] = ItemPrice
	FROM Items i 
	JOIN ItemTypes it ON i.ItemTypeId = it.ItemTypeId
	WHERE ItemTypeName LIKE 'F%'
	AND MinimumQty > 5
	GROUP BY ItemId, ItemTypeName, ItemPrice
) AS a
GROUP BY ID