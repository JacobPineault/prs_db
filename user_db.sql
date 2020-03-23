SELECT * FROM prs_db_create.user;

select concat(FirstName, " ", LastName) as 'Employee Name', PhoneNumber as 'Contact Number',
	Email
    from User;

/*
select u.UserName, concat (U.FirstName, " ", U.LastName) as 'Employee Name', v.Name, v.PhoneNumber,
	p.Name, p.Price, p.PartNumber
	from User u
    join Vendor v
	  on u.ID = v.UserID
	join Product p
	  on v.ID = p.VendorID;
   */   
      
      

