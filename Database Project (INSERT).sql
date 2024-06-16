USE bEJibun
GO

-- Sebagian data akan dimasukkan dalam file ini, sisanya di file SIMULATE TRANSACTION
INSERT INTO Customers VALUES
('CU001','Umi Padmasari','Female','083371374711','1998-08-01'),
('CU002','Natalia Yuniar','Female','0896488693','1999-02-18'),
('CU003','Tony Stark','Male','089131234567','1995-04-04'),
('CU004','Yelena Belova','Female','08987654321','1996-01-03'),
('CU005','Clint Barton','Male','081234567890','1991-01-07'),
('CU006','Peter Parker','Male','08349876432','1999-06-01'),
('CU007','Bruce Banner','Male','089988776655','1997-11-22'),
('CU008','Natasha Romanoff','Female','081233445566','1994-11-22'),
('CU009','Steve Rogers','Male','081344336655','2002-06-13'),
('CU010','Wanda Maximoff','Female','089966775544','1999-02-16');

INSERT INTO Staffs VALUES
('ST001','Mark Sloan','Male','085687533575', 4500000),
('ST002','Meredith Grey','Female','08123456789', 4000000),
('ST003','Derek Shepherd','Male','089876541234', 5000000),
('ST004','Alex Karev','Male','083745670987', 3800000),
('ST005','Christina Yang','Female','082365439870', 6000000),
('ST006','Izzie Stevens','Female','089912344321', 8000000),
('ST007','April Kepner','Female','089645670890', 4500000),
('ST008','Jackson Avery','Male','089834568759', 5000000),
('ST009','Jack Robbins','Male','081456738647', 5500000),
('ST010','Andrew Deluca','Male','081246829764', 4000000);

INSERT INTO Vendors VALUES
('VE001','BB Beverages','081277772228','Food Street','bb@yahoo.com'),
('VE002','Foodaza','089830002111','Food Street','foodaza@outlook.com'),
('VE003','K&M','085678789898','Oracle 7 Street','knm@gmail.com'),
('VE004','Furnia','082267216553','Miracle Street','miracle@gmail.com'),
('VE005','MyPen','082116784432','Stanhope Willow Street','mypen@yahoo.com'),
('VE006','Gadget Town','081213067890','Stelvio Street','gt@gmail.com'),
('VE007','Health Pharmacy','089823111133','Food Street','hpharmacy@gmail.com'),
('VE008','Bones Petshop','082142218742','Stelvio Street','bonespet@outlook.com'),
('VE009','Gramed','089000126732','Miracle Street','gramed@yahoo.com'),
('VE010','Run2Run','081363847621','Oracle 7 Street','run2run@gmail.com');

INSERT INTO ItemTypes VALUES
('IP001','Drink'),
('IP002','Food'),
('IP003','Fashion'),
('IP004','Decoration'),
('IP005','Stationery'),
('IP006','Electronic'),
('IP007','Medicine'),
('IP008','Pets'),
('IP009','Book'),
('IP010','Sports');

INSERT INTO Items VALUES
('IT001','IP001','Chocolate Milk', 10000, 2),
('IT002','IP002','Bread', 15000, 6),
('IT003','IP002','Cheese', 20000, 6),
('IT004','IP003','Shirt', 100000, 1),
('IT005','IP003','Track Pants', 300000, 1),
('IT006','IP003','Sweatshirt', 250000, 1),
('IT007','IP004','Horse Statue', 500000, 1),
('IT008','IP005','Pencil', 5000, 5),
('IT009','IP005','Eraser', 3000, 5),
('IT010','IP006','Earphone', 100000, 1),
('IT011','IP006','Wireless Mouse', 250000, 1),
('IT012','IP007','Paracetamol', 20000, 2),
('IT013','IP008','Dog Food', 50000, 1),
('IT014','IP009','Kamus Inggris - Indonesia', 50000, 1),
('IT015','IP010','Basketball', 80000, 1);

INSERT INTO SalesTransactions VALUES
('SA001','ST001','CU002','2019-02-14'),
('SA002','ST001','CU010','2019-02-28'),
('SA003','ST002','CU002','2019-05-07'),
('SA004','ST001','CU006','2019-05-15'),
('SA005','ST008','CU009','2019-09-27'),
('SA006','ST001','CU001','2019-10-18'),
('SA007','ST003','CU001','2019-11-06'),
('SA008','ST004','CU003','2019-11-29'),
('SA009','ST005','CU004','2019-12-31'),
('SA010','ST006','CU006','2020-01-04'),
('SA011','ST007','CU008','2020-01-28'),
('SA012','ST008','CU007','2020-02-03'),
('SA013','ST009','CU002','2020-02-04'),
('SA014','ST003','CU010','2020-03-11'),
('SA015','ST003','CU002','2020-04-09');

INSERT INTO CustomerOrders VALUES
('SA001','IT001',5),
('SA001','IT002',6),
('SA002','IT009',5),
('SA002','IT010',4),
('SA002','IT013',2),
('SA002','IT015',1),
('SA003','IT008',10),
('SA003','IT009',10),
('SA003','IT013',5),
('SA004','IT008',7),
('SA005','IT005',5),
('SA005','IT007',2),
('SA006','IT001',5),
('SA006','IT003',6),
('SA007','IT001',20),
('SA007','IT002',10),
('SA007','IT010',1),
('SA008','IT004',6),
('SA009','IT006',3),
('SA010','IT002',6),
('SA011','IT012',2),
('SA012','IT001',2),
('SA012','IT002',6),
('SA012','IT003',6),
('SA012','IT010',2),
('SA013','IT003',6),
('SA013','IT010',1),
('SA013','IT014',1),
('SA013','IT015',2),
('SA014','IT001',4),
('SA014','IT003',6),
('SA014','IT006',1),
('SA015','IT002',6),
('SA015','IT003',6),
('SA015','IT005',4);

INSERT INTO PurchaseTransactions VALUES
('PH001','ST005','VE002','2019-01-01','2019-01-17'),
('PH002','ST005','VE003','2019-01-05','2019-01-09'),
('PH003','ST001','VE007','2019-01-06','2019-01-09'),
('PH004','ST009','VE003','2019-01-10','2019-01-20'),
('PH005','ST002','VE005','2019-01-11','2019-01-20'),
('PH006','ST003','VE006','2019-01-15','2019-01-20'),
('PH007','ST010','VE010','2019-01-18','2019-01-25'),
('PH008','ST001','VE004','2019-01-25','2019-01-31'),
('PH009','ST002','VE008','2019-01-15','2019-02-01'),
('PH010','ST008','VE009','2019-01-29','2019-02-05'),
('PH011','ST008','VE006','2019-03-01','2019-03-15'),
('PH012','ST007','VE010','2019-03-01','2019-03-10'),
('PH013','ST004','VE001','2019-03-01','2019-03-20'),
('PH014','ST006','VE002','2019-03-11','2019-03-20'),
('PH015','ST004','VE008','2019-03-15','2019-04-01'),
('PH016','ST001','VE003','2019-09-27','2019-09-30'),
('PH017','ST005','VE004','2019-09-27','2019-10-02'),
('PH018','ST002','VE006','2020-02-04','2020-02-14'),
('PH019','ST007','VE005','2021-10-22','2021-10-31');

INSERT INTO PurchaseOrders VALUES
('PH001','IT001',20),
('PH001','IT002',20),
('PH001','IT003',20),
('PH002','IT004',10),
('PH003','IT012',10),
('PH004','IT004',5),
('PH004','IT005',5),
('PH004','IT006',15),
('PH005','IT008',20),
('PH005','IT009',20),
('PH006','IT010',5),
('PH006','IT011',5),
('PH007','IT015',2),
('PH008','IT007',2),
('PH009','IT013',5),
('PH010','IT014',3),
('PH011','IT010',3),
('PH011','IT011',3),
('PH012','IT015',5),
('PH013','IT001',100),
('PH014','IT002',50),
('PH014','IT003',20),
('PH015','IT013',20),
('PH016','IT005',50),
('PH017','IT007',10),
('PH018','IT010',10),
('PH018','IT011',2),
('PH019','IT008',50),
('PH019','IT009',50);