use btss6_management_db;
create view v_order_info AS
    select
    id,
    order_date,
    name
   from orders;

select * from v_order_info;