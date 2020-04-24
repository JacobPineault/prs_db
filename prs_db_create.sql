-- prs database
drop database if exists prs_db_create;
create database prs_db_create;
use prs_db_create;

-- User information
create table User (
	ID				int				primary key auto_increment,
    UserName		varchar(20)		not null,
    Password		varchar(10)		not null,
    FirstName		varchar(20)		not null,
    LastName		varchar(20)		not null,
    PhoneNumber		varchar(12)		not null,
    Email			varchar(75)		not null,
    IsReviewer		TinyInt			not null,
    IsAdmin			TinyInt			not null,
    constraint uname unique (Username)
);

-- Vendor information
create table Vendor (
	ID					int				primary key auto_increment,
	Code				varchar(12)		not null,
    Name				varchar(255)	not null,
    Address				varchar(255)	not null,
    City				varchar(255)	not null,
    State				varchar(2)		not null,
    Zip					varchar(5)		not null,
    PhoneNumber			varchar(12)		not null,
    Email				varchar(100)	not null,
    constraint vcode unique (Code)
);

-- Commenting out  Requirements and LineItem for testing initial tables
-- Request requirements
create table Request (
	ID					int				primary key auto_increment,
    UserID				int				not null,
    Description			varchar(100)	not null,
    Justification		varchar(255)	not null,
    DateNeeded			date			not null,
    DeliveryMode		varchar(25)		not null,
    Status				varchar(20)		not null,
    Total				decimal(10,2)	not null,
    SubmittedDate		datetime		not null,
    ReasonForRejection	varchar(100),
    foreign key (UserID) references User(ID)
);


-- Product informantion
create table Product (
	ID					int				primary key auto_increment,
    VendorID			int				not null,
    PartNumber			varchar(50)		not null,
    Name				varchar(150)	not null,
    Price				decimal(10,2)	not null,
    Unit				varchar(255),
    PhotoPath			varchar(255),
    foreign key (VendorID) references Vendor(ID),
    constraint vendor_part unique (VendorID, PartNumber)
);


-- LineItem specifications
create table LineItem (
	ID					int				primary key auto_increment,
    RequestID			int				not null,
    ProductID			int				not null,
    Quantity			int 			not null,
    foreign key (RequestID) references Request(ID),
    foreign key (ProductID) references Product(ID),
    constraint req_pdt unique (RequestID, ProductID)
);

-- insert User information
insert into User (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin)
	values ('1', 'jakepino', 'Train@MAX1', 'Jacob', 'Pineault', '513-291-6276', 'jakewilliam3@gmail.com', 1, 1);
insert into User (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin)
	values ('2', 'partickstar', 'Train@MAX2', 'Patrick', 'Star', '513-292-6276', 'patrickstar@gmail.com', 1, 0);
insert into User (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin)
	values ('3', 'bobdobalina', 'Train@MAX3', 'Bob', 'Dobalina', '513-293-6276', 'bobdobalina@gmail.com', 0, 0);
    
-- insert Vendor information    
insert into Vendor (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email)
	values (1, 'MicroCent01', 'Micro Center', '11755 Mosteller Rd', 'Sharonville', 'OH', 45241, '513-782-8500', 'ordering@microcenter.com');
insert into Vendor (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email)
	values (2, 'BestBuy01', 'Best Buy', '650 Eastgate South Dr', 'Cincinnati', 'OH', '45245', '513-753-7062', 'ordering@bestbuy.com');
insert into Vendor (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email)
	values (3, 'Staples01', 'Staples', '9550 Mason Mongomery Rd', 'Mason', 'OH', '45040', '513-754-0235', 'ordering@staples.com');
    
/* -- insert Request information
insert into Request (UserID, Description, Justification, DateNeeded, DelieveryMode, Satus, Total, SubmittedDate, ReasonForRejection)
	values ();
*/

/* insert Product information
    exclude PhotoPath for the time being*/
-- MicroCenter
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values (1, 1, '810234031066', 'Aleph Objects TAZ Workhorse', '2950.00', 1, null);
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values (2, 1, '889349929179', 'Asus ROG Swift HDR Curved LED Monitor', '2499.99', 1, null);
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values (3, 1, '884116367635', 'Dell PowerEdge T340 Server', '3299.99', 3, null);
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values (4, 1, '884116269755', 'Dell 27" Full HD LED Monitor', '179.99', 1, null);

-- Best Buy
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values (5, 2, '887276303666', 'Samsung 860 2TB SATA SSD', '229.99', 1, null);
-- Same product as #4 with increased price
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values (6, 2, '884116269755', 'Dell 27" Full HD LED Monitor','199.99', 1, null);
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values (7, 2, '641719015383', 'MacBook Pro 16 2TB SSD"', '3999.00', 1, null);
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values (8, 2, '606449100730', 'NETGEAR AC750 Wi-Fi Range Extender', '74.99', 1, null);

-- Staples
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values (9, 3, '2554455', 'Kelburne Luxura Faux Leather Desk Chair', '149.99', 14, null);
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values (10, 3, '24298531', 'Epson EX3260 LCD Projector', '449.99', 2, null);
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values (11, 3, '24359320', 'Dell 27" LED Monitor', '149.99', 1, null);
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values (12, 3, 'IM17AH247', 'Asus StudioBook 17" 1TB SSD', '2034.99', 1, null);

/*    
-- insert LineItem information
insert into LineItem  (RequestID, ProductID, Quantity)
	values ();
*/
