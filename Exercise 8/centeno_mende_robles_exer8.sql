-------------------------------
-- Number 1

INSERT INTO tblitem(itemname, itemqtyprice) VALUES("WcDough Hot 'n Spicy WcChicken", 65);

-------------------------------
-- Number 2

INSERT INTO tblorder VALUES(
    100, 
    (SELECT SUM(itemqtyprice) from tblitem WHERE itemname IN ("WcDough Burger", "WcDough Fries Regular", "WcDough Banana Pie")),
    CURDATE()
);

-------------------------------
-- Number 3

INSERT INTO tblorderitems VALUES 
    (100, (SELECT itemno from tblitem WHERE itemname="WcDough Burger"), 1, (SELECT itemqtyprice from tblitem WHERE itemname="WcDough Burger")),
    (100, (SELECT itemno from tblitem WHERE itemname="WcDough Fries Regular"), 1, (SELECT itemqtyprice from tblitem WHERE itemname="WcDough Fries Regular")),
    (100, (SELECT itemno from tblitem WHERE itemname="WcDough Banana Pie"), 1, (SELECT itemqtyprice from tblitem WHERE itemname="WcDough Banana Pie"))
;
-------------------------------
-- Number 4

update tblorder set ordertotalprice=(select sum(itemtotalprice) from tblorderitems where orderno=6) where orderno=6;
-------------------------------
-- Number 5
update tblitem set itemqtyprice=itemqtyprice+(itemqtyprice*0.05);
-------------------------------
-- Number 6
update tblorderitems set itemqty=itemqty*2, itemtotalprice=110  where orderno=3 and itemno=(SELECT itemno from tblitem WHERE itemname="WcDough Cheese Burger");
-------------------------------

-- Number 7

UPDATE tblitem SET itemdesc="Really spicy chicken sandwich!" WHERE itemname="WcDough Hot 'n Spicy WcChicken";

-------------------------------
-- Number 8

--
DELETE FROM tblitem WHERE itemno NOT IN (SELECT DISTINCT itemno FROM tblorderitems);

-------------------------------
-- Number 9

--
DELETE FROM tblorderitems WHERE itemqty=2;
-------------------------------
-- Number 10

-- july to september
DELETE FROM tblorder WHERE SUBSTRING(orderdate, 6, 2) IN ("07", "08", "09");

-------------------------------