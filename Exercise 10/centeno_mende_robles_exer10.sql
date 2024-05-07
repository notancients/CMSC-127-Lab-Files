-- Number 1

--
CREATE USER ostler IDENTIFIED BY 'care4horses';

-- Number 2

--
GRANT SELECT, INSERT, UPDATE, DELETE ON horseracing.horse TO ostler;

-- Number 3

--
REVOKE INSERT ON horseracing.horse FROM ostler;

-- Number 4

--
START TRANSACTION;
DELETE FROM horse;

-- Number 5

--
ROLLBACK;

-- Number 6
START TRANSACTION;
UPDATE horse SET earnings=earnings*0.125 WHERE breed="Arabian";
SAVEPOINT payday125;
UPDATE horse SET favorite_food="Guyabano" WHERE favorite_food IS NULL;
SAVEPOINT chgFood;

-- Number 7
RELEASE SAVEPOINT chgFood;

-- Number 8
ROLLBACK TO payday125;

-- Number 9
COMMIT;

-- Number 10

DROP USER ostler;