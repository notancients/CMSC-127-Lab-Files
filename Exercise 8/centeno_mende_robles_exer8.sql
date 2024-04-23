SELECT * FROM tblitem; SELECT * from tblorder; SELECT * FROM tblorderitems;
-------------------------------
-- Number 2

INSERT INTO tblorder VALUES(
    100, 
    (SELECT SUM(itemqtyprice) from tblitem WHERE itemname IN ("WcDough Burger", "WcDough Fries Regular", "WcDough Banana Pie")),
    CURDATE()
);

--
INSERT INTO tblorderitems VALUES 
    (100, (SELECT itemno from tblitem WHERE itemname="WcDough Burger"), 1, (SELECT itemqtyprice from tblitem WHERE itemname="WcDough Burger")),
    (100, (SELECT itemno from tblitem WHERE itemname="WcDough Fries Regular"), 1, (SELECT itemqtyprice from tblitem WHERE itemname="WcDough Fries Regular")),
    (100, (SELECT itemno from tblitem WHERE itemname="WcDough Banana Pie"), 1, (SELECT itemqtyprice from tblitem WHERE itemname="WcDough Banana Pie"))
;

-------------------------------
-- Number 3


-------------------------------
-- Number 7

UPDATE tblitem SET itemdesc="Really spicy chicken sandwich!" WHERE itemname="WcDough Hot 'n Spicy WcChicken";

-------------------------------
-- Number 8

--
SELECT DISTINCT itemno FROM tblorderitems;
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