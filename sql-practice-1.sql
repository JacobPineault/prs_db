select * from user;
insert into user (UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin)
 values('bwilly', 'mmclane', 'Bruce', 'Willis', '777-777-7777', 'diehard1@test.com', 0, 0);
 select * from user where id = 3;
 update user set lastname = 'Dummerson' where id = 5;
 -- vendordelete from user where id = 5;