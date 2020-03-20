-- prs database
drop database if exists prs_db;
create database prs_db;
use prs_db;

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
	Code				varchar(10)		not null,
    Name				varchar(255)	not null,
    Address				varchar(255)	not null,
    City				varchar(255)	not null,
    State				varchar(2)		not null,
    Zip					varchar(5)		not null,
    PhoneNumber			varchar(12)		not null,
    Email				varchar(100)	not null,
    constraint vcode unique (Code)
);

-- Request requirments
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