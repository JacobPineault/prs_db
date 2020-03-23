SELECT * FROM prs_db_create.vendor;

select v.Name, v.PhoneNumber, v.Email, p.Name as 'Item Requested', concat('$', p.Price) as 'Price'
	from vendor v
    join product p
      on v.ID = p.VendorID
      order by p.Price asc;