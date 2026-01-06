use btss6_management_db;

select * from orders;

    ALTER TABLE orders ADD COLUMN status VARCHAR(50);
--
CREATE INDEX idx_search_status_date
ON orders(status, order_date);