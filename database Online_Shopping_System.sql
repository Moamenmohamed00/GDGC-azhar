create database Online_Shopping_System;
use Online_Shopping_System;
create table Customer(
customer_id int identity primary key,
email varchar(255) not null,
name varchar(35) not null,
cust_address varchar(100) unique,
phone bigint not null
);
create table order_orderDetails(
orderID int identity(1,1) primary key,
orderDate date default getdate(),
status varchar(30) check(status in ('pending','cancelled','shipped','delivered')),
totalAmount decimal(10,2) not null default 0,
customerID int not null,
foreign key(customerID)references Customer(customer_id),
detailsID int not null,
quantity int  CHECK(quantity > 0),
price decimal(8,2) default 0,
);
create table product(
orderID int not null,
productID int identity primary key,
category nvarchar(max),
name nvarchar(35),
price decimal(8,2)CHECK(price >= 0),
description nvarchar(max),
);
create table supplier(
suppleirID int identity primary key,
category nvarchar(max),
name nvarchar(35),
contactInfo bigint,
);
create table order_product(
orderID int not null,
productID int not null,
foreign key(orderID)references order_orderDetails(orderID),
foreign key(productID)references product(productID),
);
create table suppleir_product(
supplierID int not null,
productID int not null,
foreign key(supplierID)references supplier(suppleirID),
foreign key(productID)references product(productID),
);
INSERT INTO Customer (email, name, cust_address, phone) VALUES
('john@example.com', 'John Doe', '123 Main St', 1234567890),
('alice@example.com', 'Alice Smith', '456 Oak St', 9876543210),
('michael@example.com', 'Michael Johnson', '789 Pine St', 1122334455),
('sara@example.com', 'Sara Williams', '135 Maple Ave', 2233445566),
('david@example.com', 'David Brown', '246 Birch Rd', 3344556677),
('chris@example.com', 'Chris White', '357 Cedar St', 4455667788),
('linda@example.com', 'Linda Green', '468 Elm St', 5566778899),
('robert@example.com', 'Robert Black', '579 Willow St', 6677889900),
('emily@example.com', 'Emily Adams', '680 Chestnut St', 7788990011),
('brian@example.com', 'Brian Scott', '791 Redwood St', 8899001122),
('kevin@example.com', 'Kevin Hall', '802 Spruce St', 9900112233),
('jessica@example.com', 'Jessica Young', '913 Fir St', 1122334455),
('steven@example.com', 'Steven Harris', '102 Ash St', 2233445566),
('karen@example.com', 'Karen Martin', '113 Poplar St', 3344556677),
('daniel@example.com', 'Daniel Lee', '124 Beech St', 4455667788),
('nancy@example.com', 'Nancy Clark', '135 Dogwood St', 5566778899),
('jason@example.com', 'Jason Lewis', '146 Sycamore St', 6677889900),
('rebecca@example.com', 'Rebecca Walker', '157 Hickory St', 7788990011),
('thomas@example.com', 'Thomas Allen', '168 Palm St', 8899001122),
('kimberly@example.com', 'Kimberly Wright', '179 Magnolia St', 9900112233),
('peter@example.com', 'Peter King', '190 Cypress St', 1122334455),
('donna@example.com', 'Donna Evans', '201 Sequoia St', 2233445566),
('gary@example.com', 'Gary Baker', '212 Olive St', 3344556677),
('patricia@example.com', 'Patricia Nelson', '223 Acacia St', 4455667788),
('ryan@example.com', 'Ryan Carter', '234 Aspen St', 5566778899),
('ashley@example.com', 'Ashley Perez', '245 Laurel St', 6677889900),
('william@example.com', 'William Collins', '256 Myrtle St', 7788990011),
('megan@example.com', 'Megan Stewart', '267 Palm St', 8899001122),
('charles@example.com', 'Charles Sanchez', '278 Oakwood St', 9900112233),
('brenda@example.com', 'Brenda Morris', '289 Willowwood St', 1122334455);

INSERT INTO order_orderDetails (status, totalAmount, customerID, detailsID, quantity, price) VALUES
('pending', 99.99, 1, 101, 2, 49.99),
('shipped', 150.00, 2, 102, 3, 50.00),
('delivered', 200.75, 3, 103, 4, 50.19),
('pending', 75.25, 4, 104, 1, 75.25),
('cancelled', 30.00, 5, 105, 2, 15.00),
('shipped', 450.00, 6, 106, 5, 90.00),
('delivered', 99.99, 7, 107, 2, 49.99),
('pending', 180.00, 8, 108, 3, 60.00),
('shipped', 210.50, 9, 109, 3, 70.17),
('delivered', 59.99, 10, 110, 1, 59.99),
('pending', 25.00, 11, 111, 1, 25.00),
('shipped', 310.00, 12, 112, 4, 77.50),
('delivered', 149.99, 13, 113, 3, 49.99),
('pending', 99.99, 14, 114, 2, 49.99),
('shipped', 399.00, 15, 115, 5, 79.80),
('delivered', 88.88, 16, 116, 2, 44.44),
('pending', 150.00, 17, 117, 3, 50.00),
('shipped', 500.00, 18, 118, 5, 100.00),
('delivered', 19.99, 19, 119, 1, 19.99),
('cancelled', 9.99, 20, 120, 1, 9.99),
('shipped', 59.95, 21, 121, 3, 19.98),
('delivered', 79.00, 22, 122, 4, 19.75),
('pending', 89.99, 23, 123, 2, 44.99),
('shipped', 120.00, 24, 124, 4, 30.00),
('delivered', 220.50, 25, 125, 3, 73.50),
('pending', 15.00, 26, 126, 1, 15.00),
('shipped', 49.99, 27, 127, 2, 24.99),
('delivered', 69.99, 28, 128, 3, 23.33),
('pending', 90.00, 29, 129, 3, 30.00),
('shipped', 110.00, 30, 130, 2, 55.00);
--truncate table order_orderDetails;
--drop database Online_Shopping_System;
--truncate table order_orderDetails;
-- Insert into Product Table
INSERT INTO product (orderID, category, name, price, description) VALUES
(1, 'Electronics', 'Smartphone', 699.99, 'Latest model smartphone with advanced features'),
(2, 'Clothing', 'Jeans', 49.99, 'Denim jeans for casual wear'),
(3, 'Home', 'Vacuum Cleaner', 129.99, 'Powerful vacuum cleaner with HEPA filter'),
(4, 'Toys', 'Lego Set', 79.99, 'Creative Lego building set for kids'),
(5, 'Beauty', 'Perfume', 59.99, 'Luxury fragrance for men and women'),
(6, 'Books', 'Science Fiction Novel', 19.99, 'Bestselling sci-fi book'),
(7, 'Kitchen', 'Blender', 89.99, 'High-speed blender for smoothies'),
(8, 'Fitness', 'Dumbbells', 29.99, 'Set of adjustable dumbbells'),
(9, 'Gaming', 'Gaming Mouse', 49.99, 'High precision gaming mouse'),
(10, 'Automotive', 'Car Charger', 14.99, 'Fast charging car adapter'),
(11, 'Pets', 'Dog Bed', 34.99, 'Soft and comfortable bed for dogs'),
(12, 'Music', 'Wireless Earbuds', 99.99, 'Noise-cancelling wireless earbuds'),
(13, 'Fashion', 'Sneakers', 74.99, 'Stylish sneakers for all-day wear'),
(14, 'Office', 'Ergonomic Chair', 199.99, 'Comfortable chair for office use'),
(15, 'Camping', 'Tent', 149.99, 'Waterproof camping tent'),
(16, 'Smart Home', 'Smart Bulb', 24.99, 'WiFi-enabled LED bulb'),
(17, 'Grocery', 'Organic Honey', 9.99, 'Pure and natural honey'),
(18, 'Photography', 'Tripod', 39.99, 'Adjustable camera tripod'),
(19, 'Health', 'Vitamins', 19.99, 'Multivitamins for daily health'),
(20, 'Jewelry', 'Gold Necklace', 299.99, '18k gold necklace'),
(21, 'Gadgets', 'Smart Watch', 199.99, 'Fitness tracking smartwatch'),
(22, 'Furniture', 'Dining Table', 499.99, 'Wooden dining table with 6 chairs'),
(23, 'Tools', 'Drill Machine', 89.99, 'Electric drill machine');
INSERT INTO supplier (category, name, contactInfo) VALUES
('Electronics', 'Tech Solutions', 9876543210),
('Clothing', 'Fashion Hub', 1234567890),
('Home Appliances', 'Home Essentials', 1122334455),
('Toys', 'Toy World', 2233445566),
('Beauty', 'Glow & Shine', 3344556677),
('Books', 'Readers Haven', 4455667788),
('Kitchen', 'Kitchen Masters', 5566778899),
('Fitness', 'Fit Life', 6677889900),
('Gaming', 'Game Zone', 7788990011),
('Automotive', 'Auto Parts Co.', 8899001122),
('Pets', 'Pet Supplies', 9900112233),
('Music', 'Melody Makers', 1122334455),
('Fashion', 'Trendy Styles', 2233445566),
('Office', 'Office Needs', 3344556677),
('Camping', 'Outdoor Gear', 4455667788),
('Smart Home', 'Smart Living', 5566778899),
('Grocery', 'Fresh Market', 6677889900),
('Photography', 'Photo Experts', 7788990011),
('Health', 'Wellness Co.', 8899001122),
('Jewelry', 'Luxury Jewels', 9900112233),
('Gadgets', 'Innovative Tech', 1122334455),
('Furniture', 'Cozy Homes', 2233445566),
('Tools', 'Handy Tools', 3344556677),
('Electronics', 'Digital World', 4455667788),
('Clothing', 'Modern Wear', 5566778899),
('Gaming', 'Pro Gamers', 6677889900),
('Books', 'Literary Land', 7788990011),
('Fitness', 'Healthy Life', 8899001122),
('Beauty', 'Elite Cosmetics', 9900112233),
('Toys', 'Kids Kingdom', 1122334455);
INSERT INTO suppleir_product (supplierID, productID) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20),
(21, 21), (22, 22), (23, 23), (24, 1), (25, 2),
(26, 3), (27, 4), (28, 5), (29, 6), (30, 7);
INSERT INTO order_product (orderID, productID) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20),
(21, 21), (22, 22), (23, 23), (24, 1), (25, 2),
(26, 3), (27, 4), (28, 5), (29, 6), (30, 7);
alter table product add rating decimal(5,2) default 0;

alter table supplier add constraint a1 default 'new' for category;

--SELECT name FROM sys.default_constraints 
--WHERE parent_object_id = OBJECT_ID('product') 
--AND parent_column_id = COLUMNPROPERTY(OBJECT_ID('product'), 'rating', 'ColumnId');
--alter table product 
--drop constraint DF__product__rating__4AB81AF0 ;
alter table product drop column rating; 

drop table Social_Media_Platform.dbo.Users;

drop database Social_Media_Platform;

update order_orderDetails
set orderDate=GETDATE() where orderID>0;

--ALTER TABLE order_product 
--DROP CONSTRAINT FK__order_pro__produ__46E78A0C;
--ALTER TABLE suppleir_product 
--DROP CONSTRAINT FK__suppleir___produ__49C3F6B7;
delete from product where name is not null and name <>'Null';