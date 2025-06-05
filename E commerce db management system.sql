create database EcommerceDB;
use EcommerceDB;
 -- Customers Table
Create table Customers (
    CustomeriD int primary key auto_increment,
    Name varchar(100) not null,
    Email varchar(100) unique not null,
    Password varchar(255) not null,
    Address text,
    Phone varchar(15) unique
);
drop table Customers;
-- Products Table
Create table Products (
    ProductID int primary key auto_increment,
    Name varchar(100) not null,
    Category varchar(50),
    Price decimal(10,2) not null,
    Stock int not null,
    Description text
);

-- Orders Table
Create table Orders (
    OrderID int primary key auto_increment,
    CustomerID int,
    TotalAmount decimal(10,2),
    Status enum('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    OrderDate timestamp default current_timestamp,
    foreign key (CustomerID) references Customers(CustomerID) on delete cascade 
);

-- Order Details Table
Create table OrderDetails (
    OrderDetailID int primary key auto_increment,
    OrderID int,
    ProductID int,
    Quantity int not null,
    Subtotal decimal(10,2) not null,
    foreign key  (OrderID) references Orders(OrderID) on delete cascade,
    foreign key (ProductID)  references Products(ProductID) on delete cascade
);

-- Reviews Table
Create table  Reviews (
    ReviewID int primary key auto_increment,
    CustomerID int,
    ProductID int,
    Rating int check (Rating between 1 and 5),
    ReviewText text,
    ReviewDate timestamp default current_timestamp,
    foreign key (CustomerID) references Customers(CustomerID)  on delete cascade,
    foreign key (ProductID) references Products(ProductID)  on delete cascade
);
 -- Insert Customers
insert into  Customers (Name, Email, Password, Address, Phone) 
values 
('Pihu Santra', 'pihu@example.com', 'hashedpassword1', 'Delhi, India', '9876543210'),
('Deepa Sharma', 'deepa@example.com', 'hashedpassword2', 'Mumbai, India', '9123456789');

-- Insert Products
insert into Products (Name, Category, Price, Stock, Description) 
values
('Smartphone', 'Electronics', 19999.99, 50, 'Latest 5G smartphone with AMOLED display'),
('Laptop', 'Electronics', 59999.99, 30, 'Gaming laptop with RTX graphics'),
('Headphones', 'Accessories', 2499.99, 100, 'Wireless noise-canceling headphones'),
('Washing Machine', 'Home Appliances', 19999.99, 20, 'Fully automatic front-load washing machine');

-- Insert Orders
insert into  Orders (CustomerID, TotalAmount, Status) 
values
(1, 19999.99, 'Pending'),
(2, 59999.99, 'Shipped');

-- Insert Order Details
insert into  OrderDetails (OrderID, ProductID, Quantity, Subtotal) 
values
(1, 1, 1, 19999.99),
(2, 2, 1, 59999.99);

-- Insert Reviews
insert into Reviews (CustomerID, ProductID, Rating, ReviewText) 
values
(1, 1, 5, 'Amazing smartphone with great battery life!'),
(2, 2, 4, 'Powerful laptop but slightly overpriced.');
select * from Customers;
select * from Products;
select * from Orders;
select * from OrderDetails;
select * from Reviews;