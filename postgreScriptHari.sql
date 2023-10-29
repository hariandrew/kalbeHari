-- Nama: Hari Andrew

-- query 1 : Berapa rata-rata umur customer jika dilihat dari marital statusnya ?
select "Marital Status", floor(avg(age)) from "Transaction" t
join customer c on c.customerid = t.customerid
group by "Marital Status"
-- result: Married = 43, Single = 29


-- query 2 : Berapa rata-rata umur customer jika dilihat dari gender nya ?
select gender , floor(avg(age)) from "Transaction" t
join customer c on c.customerid = t.customerid
group by gender
-- result: gender 0 (wanita) = 40, gender 1 (pria) = 39


-- query 3 : Tentukan nama store dengan total quantity terbanyak!
select s.storeid , storename , sum(qty) as totalqty from "Transaction" t 
join store s on s.storeid = t.storeid
group by s.storeid, storename
limit 1
-- result: storeid = 11, storename = Sinar Harapan, totalqty = 1331


-- query 4: Tentukan nama produk terlaris dengan total amount terbanyak!
select p.productid, "Product Name" , sum(totalamount) as totalamount from "Transaction" t 
join product p on p.productid = t.productid 
group by p.productid , "Product Name" 
order by sum(totalamount) desc
limit 1
-- result: productid = 10, productname = Cheese Stick, totalamount = 27,615,000
