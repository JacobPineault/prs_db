SELECT * FROM prs.lineitem;
insert into lineitem (RequestId, ProductId, Quantity)
values ('1', '14', '2'),
		('1', '15','1');
        
-- 4 table join user - request - line item
select u.FirstName, u.LastName, justification, description, justification, p.name as 'product name', p.price, quantity
 from request r
 join lineitem li
 on r.id = li.RequestId
 join user u 
 on u.id = r.userid
 join product p 
 on p.id = li.productid;