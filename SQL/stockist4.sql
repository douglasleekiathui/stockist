/*
this script creates 5 tables: products, suppliers, users, transactions, transactionlines
products contains products details, quantities and recommended supplier which is linked to suppliers
transactions is the header table for transactionlists, contains created_by which is username and created_for which can be used to store customer and supplier name
transactionlists has 2 primary keys, transaction_no and line_no
dummy data is put in users, suppliers and products
transactions and transactionlists have NO data yet
*/

CREATE SCHEMA `stockist4` ;

CREATE TABLE `stockist4`.`products` (
`product_no` VARCHAR(5) NOT NULL,
`product_description` VARCHAR(255) NULL,
`dimension` VARCHAR(255) NULL,
`manufacturer` VARCHAR(16) NULL,
`reorder_qty` INT NULL,
`min_qty` INT NULL, 
`onhand_qty` VARCHAR(45) NULL,
`shelf_location` VARCHAR(16) NULL,
`primary_supplier` VARCHAR(5) NULL, 
`price` DECIMAL(10,2) NULL, 
PRIMARY KEY (`product_no`));


CREATE TABLE `stockist4`.`transactionlines` (
`transaction_no` VARCHAR(5) NOT NULL,
`line_no` INT NOT NULL,
`product_no` VARCHAR(5) NULL,
`posted_qty` INT NULL,
PRIMARY KEY (`transaction_no`, `line_no`));


CREATE TABLE `stockist4`.`transactions` (
`transaction_no` VARCHAR(5) NOT NULL,
`transaction_date` DATETIME NULL,
`transaction_type` VARCHAR(5) NULL,
`created_by` VARCHAR(16) NULL,
`created_for` VARCHAR(255) NULL, 
PRIMARY KEY (`transaction_no`));


CREATE TABLE `stockist4`.`users` (
`user` VARCHAR(16) NOT NULL,
`password` VARCHAR(255) NULL,
`user_role` VARCHAR(8) NULL,
  PRIMARY KEY (`user`));


CREATE TABLE `stockist4`.`suppliers` (
`supplier_no` VARCHAR(5) NOT NULL,
`supplier_name` VARCHAR(255) NULL,
`supplier_contact` VARCHAR(255) NULL, 
`supplier_email` VARCHAR(255) NULL,  
PRIMARY KEY (`supplier_no`));

ALTER TABLE `stockist4`.`transactions` 
ADD INDEX `users_transactions_idx` (`created_by` ASC);
ALTER TABLE `stockist4`.`transactions` 
ADD CONSTRAINT `users_transactions`
FOREIGN KEY (`created_by`)  
REFERENCES `stockist4`.`users` (`user`);

ALTER TABLE `stockist4`.`transactionlines` 
ADD CONSTRAINT `transactions_transactionlines`  
FOREIGN KEY (`transaction_no`)  
REFERENCES `stockist4`.`transactions` (`transaction_no`);

ALTER TABLE `stockist4`.`transactionlines` 
ADD INDEX `products_transactionlines_idx` (`product_no` ASC);
ALTER TABLE `stockist4`.`transactionlines` 
ADD CONSTRAINT `products_transactionlines`  
FOREIGN KEY (`product_no`)  
REFERENCES `stockist4`.`products` (`product_no`) ;

ALTER TABLE `stockist4`.`products` 
ADD INDEX `suppliers_products_idx` (`primary_supplier` ASC);
ALTER TABLE `stockist4`.`products` 
ADD CONSTRAINT `suppliers_products`  
FOREIGN KEY (`primary_supplier`)  
REFERENCES `stockist4`.`suppliers` (`supplier_no`);

INSERT INTO `stockist4`.`users` VALUES 
('admin','admin','ADMIN'),
('admin1','admin1','ADMIN'),
('mech1','mech1','MECHANIC'),
('mech2','mech2','MECHANIC'),
('mech3','mech3','MECHANIC'),
('mech4','mech4','MECHANIC');


INSERT INTO `stockist4`.`suppliers` (supplier_no,supplier_name,supplier_contact,supplier_email) VALUES 
('S0001','TOYOTA JAPAN','homozoki noriba','homozoki_noriba@toyota_japan.com.jp'),
('S0002','TOYOTA APAC','cheryl lim','cheryl_lim@toyota_apac.com'),
('S0003','NISSAN JAPAN','gotham seethee','gotham_seethee@nissan_japan.com.jp'),
('S0004','NISSAN APAC','jack sparrow','jack_sparrow@nissan_apac.com'),
('S0005','MAZDA JAPAN','pokema calamansi','pokema_calamansi@mazda_japan.com.jp'),
('S0006','MAZDA APAC','jurontoe polawaski','jurontoe_polawaski@mazda_apac.com'),
('S0007','HONDA HEADQUARTERS','folton rubber','folton_rubber@honda_headquarters.com'),
('S0008','HONDA ASIA PACIFIC PTE LTD','piecas ovesheet','piecas_ovesheet@honda_asia_pacific_pte_ltd.com'),
('S0009','HAPPY AND OILY','grimer dues','happyandoily@gmail.com'),
('S0010','HOUSE OF MIRRORS','lorstfor eva','houseofmirrors@yahoo.com.sg');


INSERT INTO `stockist4`.`products` (product_no,product_description,dimension,manufacturer,reorder_qty,min_qty,onhand_qty,shelf_location,primary_supplier,price) VALUES 
('P0001','OIL','NA','NA',60,600,1620,'ONSITE','S0009',10.2),
('P0002','OIL FILTER','NA','NA',10,100,1620,'ONSITE','S0009',10.4),
('P0003','LUBRICANT OIL','NA','NA',47,470,1620,'ONSITE','S0009',18.4),
('P0004','LUBRICANT GEL','NA','NA',18,180,1620,'ONSITE','S0009',25.4),
('P0005','BULB','NA','NA',49,490,1620,'ONSITE','S0009',26.4),
('P0006','RADIO','NA','NA',8,80,1620,'ONSITE','S0009',33.4),
('P0007','STEERING FLUID','NA','NA',20,200,1620,'ONSITE','S0009',39.4),
('P0008','BRAKE OIL','NA','NA',33,330,1620,'ONSITE','S0009',41.4),
('P0009','FRONT MIRROR','5X5','NA',5,50,1620,'ONSITE','S0010',46.4),
('P0010','REAR MIRROR','4X4','NA',41,410,1620,'ONSITE','S0010',50.4),
('P0011','SIDE MIRROR','3X3','NA',8,80,1620,'ONSITE','S0010',52.4),
('P0012','CUSTOM MIRROR','2X2','NA',22,220,1620,'ONSITE','S0010',57.3),
('P0013','WAX','NA','NA',11,110,1620,'ONSITE','S0009',63.4),
('P0014','RADIATOR','NA','NA',6,60,1620,'ONSITE','S0009',72.4),
('P0015','COOLANT','NA','NA',120,1200,1620,'ONSITE','S0009',74.4),
('P0016','BOLTS 1.1','1.1','TOYOTA',1,12,1620,'STORE','S0001',82.4),
('P0017','BOLTS 1.2','1.2','TOYOTA',1,6,1620,'STORE','S0001',89.4),
('P0018','BOLTS 1.3','1.3','TOYOTA',4,44,1620,'STORE','S0001',99.4),
('P0019','BOLTS 2.1','2.1','TOYOTA',4,38,1620,'STORE','S0001',104.4),
('P0020','BOLTS 2.2','2.2','TOYOTA',1,14,1620,'STORE','S0001',106.4),
('P0021','GEAR','4X2','TOYOTA',2,23,1620,'STORE','S0001',107.4),
('P0022','GEAR','4X3','TOYOTA',4,37,1620,'STORE','S0002',116.4),
('P0023','GEAR','4X4','TOYOTA',4,35,1620,'STORE','S0001',122.4),
('P0024','GEAR','4X5','TOYOTA',3,31,1620,'STORE','S0001',131.6),
('P0025','WINDSCREEN','10X2','TOYOTA',1,10,1620,'STORE','S0001',136.4),
('P0026','WINDSCREEN B','10X4','TOYOTA',1,5,1620,'STORE','S0002',137.4),
('P0027','WINDSCREEN C','10X6','TOYOTA',2,15,1620,'STORE','S0001',140.4),
('P0028','FRONT TYRE','20','TOYOTA',4,40,1620,'STORE','S0001',149.4),
('P0029','FRONT TYRE','25','TOYOTA',3,28,1620,'STORE','S0001',156.4),
('P0030','FRONT TYRE','30','TOYOTA',5,47,1620,'STORE','S0001',163.4),
('P0031','REAR TYRE','25','TOYOTA',1,9,1620,'STORE','S0001',168.4),
('P0032','REAR TYRE','30','TOYOTA',3,26,1620,'STORE','S0001',131.6),
('P0033','SEAT LEATHER CASING','NA','TOYOTA',2,16,1620,'STORE','S0001',131.6),
('P0034','STEERING WHEEL','NA','TOYOTA',3,27,1620,'STORE','S0001',131.6),
('P0035','SPRING BOLT','NA','TOYOTA',2,22,1620,'STORE','S0001',131.6),
('P0036','BRAKE PAD','NA','TOYOTA',4,43,1620,'STORE','S0001',131.6),
('P0037','SPARK PLUG','NA','TOYOTA',4,43,1620,'STORE','S0001',131.6),
('P0038','SHOCK ABSORBER','NA','TOYOTA',0,1,1620,'STORE','S0001',131.6),
('P0039','SUSPENSION ARM','NA','TOYOTA',3,31,1620,'STORE','S0001',131.8),
('P0040','SUSPENSION JOINT','NA','TOYOTA',4,36,1620,'STORE','S0001',131.6),
('P0041','SPRING','NA','TOYOTA',1,5,1620,'STORE','S0001',131.6),
('P0042','CLUTCH','NA','TOYOTA',5,46,1620,'STORE','S0001',131.6),
('P0043','CLUTCH CABLE','NA','TOYOTA',3,31,1620,'STORE','S0001',52.4),
('P0044','DRIVESHAFT','NA','TOYOTA',4,39,1620,'STORE','S0001',57.4),
('P0045','COMPRESSOR','NA','TOYOTA',1,5,1620,'STORE','S0001',63.4),
('P0046','EXPANSION TANK','1X1','TOYOTA',4,44,1620,'STORE','S0001',72.4),
('P0047','EXPANSION TANK B','2X2','TOYOTA',3,25,1620,'STORE','S0001',74.4),
('P0048','EXPANSION TANK C','1X2','TOYOTA',0,3,1620,'STORE','S0001',82.4),
('P0049','DRIVING BELT','NA','TOYOTA',1,8,1620,'STORE','S0001',89.4),
('P0050','DRUM BRAKE','NA','TOYOTA',1,13,1620,'STORE','S0001',99.4),
('P0051','BRAKE DISC','NA','TOYOTA',4,38,1620,'STORE','S0001',104.4),
('P0052','BRAKE SHOE','NA','TOYOTA',1,7,1620,'STORE','S0001',106.4),
('P0053','SENSOR','NA','TOYOTA',3,34,1620,'STORE','S0001',107.4),
('P0054','TAILGATE','1X2','TOYOTA',0,3,1620,'STORE','S0001',116.4),
('P0055','TAILGATE MEDIUM','1X3','TOYOTA',4,42,1620,'STORE','S0001',122.4),
('P0056','TAILGATE LARGE','2X4','TOYOTA',0,4,1620,'STORE','S0001',131.4),
('P0057','BATTERY','NA','TOYOTA',0,2,1620,'STORE','S0001',136.4),
('P0058','STARTER MOTOR','NA','TOYOTA',1,8,1620,'STORE','S0001',137.4),
('P0059','GRILLES','NA','TOYOTA',2,22,1620,'STORE','S0001',140.4),
('P0060','THERMOSTAT','NA','TOYOTA',1,7,1620,'STORE','S0001',149.4),
('P0061','FUEL INJECTOR','NA','TOYOTA',3,28,1620,'STORE','S0001',156.4),
('P0062','TIMING BELT','NA','TOYOTA',3,28,1620,'STORE','S0001',163.4),
('P0063','FLYWHEELS','NA','TOYOTA',0,4,1620,'STORE','S0001',168.4),
('P0064','BOLTS 1.1','1.1','MAZDA',1,14,1620,'STORE','S0005',172.4),
('P0065','BOLTS 1.2','1.2','MAZDA',4,41,1620,'STORE','S0005',10.2),
('P0066','BOLTS 1.3','1.3','MAZDA',4,37,1620,'STORE','S0005',10.8),
('P0067','BOLTS 2.1','2.1','MAZDA',5,47,1620,'STORE','S0005',18.9),
('P0068','BOLTS 2.2','2.2','MAZDA',4,44,1620,'STORE','S0005',25.4),
('P0069','GEAR','4X2','MAZDA',5,48,1620,'STORE','S0005',26.4),
('P0070','WINDSCREEN','10X2','MAZDA',1,12,1620,'STORE','S0005',33.4),
('P0071','FRONT TYRE','20','MAZDA',2,24,1620,'STORE','S0005',39.4),
('P0072','REAR TYRE','25','MAZDA',4,40,1620,'STORE','S0005',41.4),
('P0073','SEAT LEATHER CASING','NA','MAZDA',3,31,1620,'STORE','S0005',46.4),
('P0074','STEERING WHEEL','NA','MAZDA',1,5,1620,'STORE','S0005',50.4),
('P0075','SPRING BOLT','NA','MAZDA',2,20,1620,'STORE','S0005',52.4),
('P0076','BRAKE PAD','NA','MAZDA',3,32,1620,'STORE','S0005',57.4),
('P0077','SPARK PLUG','NA','MAZDA',4,43,1620,'STORE','S0005',10.8),
('P0078','SHOCK ABSORBER','NA','MAZDA',0,4,1620,'STORE','S0005',18.9),
('P0079','SUSPENSION ARM','NA','MAZDA',0,4,1620,'STORE','S0005',74.4),
('P0080','SUSPENSION JOINT','NA','MAZDA',4,39,1620,'STORE','S0005',82.4),
('P0081','SPRING','NA','MAZDA',1,11,1620,'STORE','S0005',89.4),
('P0082','CLUTCH','NA','MAZDA',2,24,1620,'STORE','S0005',99.4),
('P0083','CLUTCH CABLE','NA','MAZDA',2,19,1620,'STORE','S0005',104.4),
('P0084','DRIVESHAFT','NA','MAZDA',4,39,1620,'STORE','S0005',106.4),
('P0085','COMPRESSOR','NA','MAZDA',2,16,1620,'STORE','S0005',107.4),
('P0086','EXPANSION TANK','1X1','MAZDA',3,30,1620,'STORE','S0005',116.4),
('P0087','DRIVING BELT','NA','MAZDA',1,13,1620,'STORE','S0005',122.4),
('P0088','DRUM BRAKE','NA','MAZDA',3,34,1620,'STORE','S0005',131.4),
('P0089','BRAKE DISC','NA','MAZDA',3,29,1620,'STORE','S0005',136.4),
('P0090','BRAKE SHOE','NA','MAZDA',3,30,1620,'STORE','S0005',10.8),
('P0091','SENSOR','NA','MAZDA',0,1,1620,'STORE','S0005',18.9),
('P0092','TAILGATE','1X2','MAZDA',2,15,1620,'STORE','S0005',149.4),
('P0093','BATTERY','NA','MAZDA',4,38,1620,'STORE','S0005',156.4),
('P0094','STARTER MOTOR','NA','MAZDA',1,12,1620,'STORE','S0005',163.4),
('P0095','GRILLES','NA','MAZDA',3,33,1620,'STORE','S0005',168.4),
('P0096','THERMOSTAT','NA','MAZDA',1,11,1620,'STORE','S0005',172.4),
('P0097','FUEL INJECTOR','NA','MAZDA',1,14,1620,'STORE','S0005',10.2),
('P0098','TIMING BELT','NA','MAZDA',4,44,1620,'STORE','S0005',10.4),
('P0099','FLYWHEELS','NA','MAZDA',2,15,1620,'STORE','S0005',18.4),
('P0100','BOLTS 1.1','1.1','HONDA',3,29,1620,'STORE','S0007',25.4),
('P0101','BOLTS 1.2','1.2','HONDA',4,41,1620,'STORE','S0007',26.4),
('P0102','BOLTS 1.3','1.3','HONDA',0,3,1620,'STORE','S0007',10.8),
('P0103','BOLTS 2.1','2.1','HONDA',4,41,1620,'STORE','S0007',18.9),
('P0104','BOLTS 2.2','2.2','HONDA',0,3,1620,'STORE','S0007',41.4),
('P0105','GEAR','4X2','HONDA',4,37,1620,'STORE','S0007',46.4),
('P0106','WINDSCREEN','10X2','HONDA',2,24,1620,'STORE','S0007',50.4),
('P0107','FRONT TYRE','20','HONDA',0,4,1620,'STORE','S0007',52.4),
('P0108','REAR TYRE','25','HONDA',5,45,1620,'STORE','S0007',57.4),
('P0109','SEAT LEATHER CASING','NA','HONDA',4,41,1620,'STORE','S0007',63.4),
('P0110','STEERING WHEEL','NA','HONDA',5,50,1620,'STORE','S0007',72.4),
('P0111','SPRING BOLT','NA','HONDA',5,49,1620,'STORE','S0007',74.4),
('P0112','BRAKE PAD','NA','HONDA',3,34,1620,'STORE','S0007',82.4),
('P0113','SPARK PLUG','NA','HONDA',3,26,1620,'STORE','S0007',10.8),
('P0114','SHOCK ABSORBER','NA','HONDA',3,31,1620,'STORE','S0007',18.9),
('P0115','SUSPENSION ARM','NA','HONDA',3,34,1620,'STORE','S0007',104.4),
('P0116','SUSPENSION JOINT','NA','HONDA',1,6,1620,'STORE','S0007',106.4),
('P0117','SPRING','NA','HONDA',1,13,1620,'STORE','S0007',107.4),
('P0118','CLUTCH','NA','HONDA',1,10,1620,'STORE','S0007',116.4),
('P0119','CLUTCH CABLE','NA','HONDA',1,10,1620,'STORE','S0007',122.4),
('P0120','DRIVESHAFT','NA','HONDA',1,11,1620,'STORE','S0007',131.4),
('P0121','COMPRESSOR','NA','HONDA',5,45,1620,'STORE','S0007',136.4),
('P0122','EXPANSION TANK','1X1','HONDA',3,25,1620,'STORE','S0007',137.4),
('P0123','DRIVING BELT','NA','HONDA',1,5,1620,'STORE','S0007',140.4),
('P0124','DRUM BRAKE','NA','HONDA',5,49,1620,'STORE','S0007',149.4),
('P0125','BRAKE DISC','NA','HONDA',1,10,1620,'STORE','S0007',156.4),
('P0126','BRAKE SHOE','NA','HONDA',1,8,1620,'STORE','S0007',163.4),
('P0127','SENSOR','NA','HONDA',2,21,1620,'STORE','S0007',168.4),
('P0128','TAILGATE','1X2','HONDA',3,26,1620,'STORE','S0007',172.4),
('P0129','BATTERY','NA','HONDA',4,38,1620,'STORE','S0007',10.2),
('P0130','STARTER MOTOR','NA','HONDA',0,1,1620,'STORE','S0007',10.4),
('P0131','GRILLES','NA','HONDA',1,10,1620,'STORE','S0007',10.8),
('P0132','THERMOSTAT','NA','HONDA',3,30,1620,'STORE','S0007',18.9),
('P0133','FUEL INJECTOR','NA','HONDA',3,25,1620,'STORE','S0007',26.4),
('P0134','TIMING BELT','NA','HONDA',2,16,1620,'STORE','S0007',33.4),
('P0135','FLYWHEELS','NA','HONDA',2,23,1620,'STORE','S0007',39.4),
('P0136','BOLTS 1.1','1.1','NISSAN',3,27,1620,'STORE','S0003',41.4),
('P0137','BOLTS 1.2','1.2','NISSAN',2,24,1620,'STORE','S0003',46.4),
('P0138','BOLTS 1.3','1.3','NISSAN',5,45,1620,'STORE','S0003',50.4),
('P0139','BOLTS 2.1','2.1','NISSAN',2,17,1620,'STORE','S0003',52.4),
('P0140','BOLTS 2.2','2.2','NISSAN',0,2,1620,'STORE','S0003',57.4),
('P0141','GEAR','4X2','NISSAN',2,21,1620,'STORE','S0003',10.8),
('P0142','WINDSCREEN','10X2','NISSAN',4,35,1620,'STORE','S0004',18.9),
('P0143','FRONT TYRE','20','NISSAN',1,11,1620,'STORE','S0003',74.4),
('P0144','REAR TYRE','25','NISSAN',5,45,1620,'STORE','S0003',82.4),
('P0145','SEAT LEATHER CASING','NA','NISSAN',2,17,1620,'STORE','S0003',89.4),
('P0146','STEERING WHEEL','NA','NISSAN',3,28,1620,'STORE','S0003',99.4),
('P0147','SPRING BOLT','NA','NISSAN',3,26,1620,'STORE','S0003',104.4),
('P0148','BRAKE PAD','NA','NISSAN',3,25,1620,'STORE','S0003',106.4),
('P0149','SPARK PLUG','NA','NISSAN',1,7,1620,'STORE','S0003',107.4),
('P0150','SHOCK ABSORBER','NA','NISSAN',2,21,1620,'STORE','S0003',116.4),
('P0151','SUSPENSION ARM','NA','NISSAN',1,7,1620,'STORE','S0003',122.4),
('P0152','SUSPENSION JOINT','NA','NISSAN',0,1,1620,'STORE','S0003',131.4),
('P0153','SPRING','NA','NISSAN',0,1,1620,'STORE','S0003',136.4),
('P0154','CLUTCH','NA','NISSAN',4,35,1620,'STORE','S0003',10.8),
('P0155','CLUTCH CABLE','NA','NISSAN',1,5,1620,'STORE','S0003',18.9),
('P0156','DRIVESHAFT','NA','NISSAN',2,16,1620,'STORE','S0003',149.4),
('P0157','COMPRESSOR','NA','NISSAN',4,43,1620,'STORE','S0003',156.4),
('P0158','EXPANSION TANK','1X1','NISSAN',3,30,1620,'STORE','S0003',163.4),
('P0159','DRIVING BELT','NA','NISSAN',4,41,1620,'STORE','S0003',168.4),
('P0160','DRUM BRAKE','NA','NISSAN',2,18,1620,'STORE','S0003',172.4),
('P0161','BRAKE DISC','NA','NISSAN',0,1,1620,'STORE','S0003',10.2),
('P0162','BRAKE SHOE','NA','NISSAN',2,15,1620,'STORE','S0004',10.4),
('P0163','SENSOR','NA','NISSAN',3,32,1620,'STORE','S0003',18.4),
('P0164','TAILGATE','1X2','NISSAN',1,11,1620,'STORE','S0003',25.4),
('P0165','BATTERY','NA','NISSAN',5,46,1620,'STORE','S0003',26.4),
('P0166','STARTER MOTOR','NA','NISSAN',3,34,1620,'STORE','S0003',33.4),
('P0167','GRILLES','NA','NISSAN',4,42,1620,'STORE','S0003',10.8),
('P0168','THERMOSTAT','NA','NISSAN',1,10,1620,'STORE','S0003',18.9),
('P0169','FUEL INJECTOR','NA','NISSAN',2,19,1620,'STORE','S0003',46.4),
('P0170','TIMING BELT','NA','NISSAN',2,22,1620,'STORE','S0003',50.4),
('P0171','FLYWHEELS','NA','NISSAN',5,46,1620,'STORE','S0003',52.4);

INSERT INTO `stockist4`.`transactions` (transaction_no,transaction_date,transaction_type,created_by,created_for) VALUES 
('T0001','2017-05-05','PO','admin','NISSAN JAPAN'),
('T0002','2017-05-06','WO','mech1','Grande Dame'),
('T0003','2017-05-07','PO','admin','HONDA ASIA PACIFIC PTE LTD'),
('T0004','2017-05-08','WO','mech2','Pinocchio'),
('T0005','2017-05-09','PO','admin','TOYOTA APAC'),
('T0006','2017-05-10','WO','mech3','Ariel LovesWater'),
('T0007','2017-05-11','PO','admin1','MAZDA JAPAN'),
('T0008','2017-05-12','WO','mech4','Heath Mayherip'),
('T0009','2017-05-13','PO','admin','TOYOTA APAC'),
('T0010','2017-05-14','WO','mech2','Pinocchio'),
('T0011','2017-05-15','PO','admin','HONDA HEADQUARTERS'),
('T0012','2017-05-16','WO','mech3','Angeline Jolly'),
('T0013','2017-05-17','PO','admin','HONDA HEADQUARTERS'),
('T0014','2017-05-18','WO','mech4','Jennifer Anyson'),
('T0015','2017-05-19','PO','admin1','HONDA HEADQUARTERS'),
('T0016','2017-05-20','WO','mech1','Edward Carlen'),
('T0017','2017-05-21','PO','admin','HOUSE OF MIRRORS'),
('T0018','2017-05-22','WO','mech3','Jack Spare Roll'),
('T0019','2017-05-23','PO','admin','HOUSE OF MIRRORS'),
('T0020','2017-05-24','WO','mech4','Postmaster Getslave'),
('T0021','2017-05-25','PO','admin','NISSAN JAPAN'),
('T0022','2017-05-26','WO','mech3','Imso Tiredandslipy'),
('T0023','2017-05-27','PO','admin1','TOYOTA APAC'),
('T0024','2017-05-28','WO','mech3','Guessy Guo'),
('T0025','2017-05-29','PO','admin','HONDA HEADQUARTERS'),
('T0026','2017-05-30','WO','mech4','Foilsa Pileguin'),
('T0027','2017-06-01','PO','admin','HONDA HEADQUARTERS');


INSERT INTO `stockist4`.`transactionlines` (transaction_no,line_no,product_no,posted_qty) VALUES 
('T0001',1,'P0131',255),
('T0001',2,'P0106',140),
('T0001',3,'P0076',209),
('T0002',1,'P0048',-84),
('T0002',2,'P0106',-5),
('T0002',3,'P0123',-148),
('T0003',1,'P0049',55),
('T0003',2,'P0019',214),
('T0003',3,'P0032',267),
('T0004',1,'P0166',-236),
('T0005',1,'P0046',39),
('T0006',1,'P0022',-39),
('T0007',1,'P0046',280),
('T0008',1,'P0140',-167),
('T0009',1,'P0022',272),
('T0009',2,'P0093',213),
('T0010',1,'P0081',-100),
('T0010',2,'P0160',-218),
('T0010',3,'P0023',-265),
('T0011',1,'P0126',30),
('T0012',1,'P0143',-51),
('T0013',1,'P0072',111),
('T0014',1,'P0096',-1),
('T0015',1,'P0161',54),
('T0016',1,'P0161',-100),
('T0017',1,'P0094',174),
('T0018',1,'P0034',-110),
('T0019',1,'P0034',151),
('T0020',1,'P0051',-171),
('T0021',1,'P0130',233),
('T0022',1,'P0034',-141),
('T0023',1,'P0051',213),
('T0024',1,'P0110',-104),
('T0025',1,'P0093',15),
('T0026',1,'P0130',-238),
('T0026',2,'P0093',-290),
('T0026',3,'P0162',-205),
('T0027',1,'P0169',204);
