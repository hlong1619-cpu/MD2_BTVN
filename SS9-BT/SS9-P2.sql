use btss6_management_db;

--
CREATE VIEW view_customer_contact AS
    SELECT
      id,
       name,
       email,
       phone
FROM customers;
SELECT * FROM view_customer_contact;
-- DROP VIEW view_customer_contact;