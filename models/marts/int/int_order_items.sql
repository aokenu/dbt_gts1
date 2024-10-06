-- CTE to fetch data from source
with orders as (
    select *
    from {{ ref('stg_orders') }}
),


line_item as (
    select *
    from {{ ref('stg_lineitem') }}
)



-- Join the CTEs on a common key (e.g., order_id)
select
    orders.o_orderkey as order_id,
    orders.o_orderdate as order_date,
    orders.o_orderstatus as order_status,
    orders.o_totalprice as amount,
    orders.o_custkey as customerid,
    line_item.l_orderkey as item_id,
    line_item.l_linestatus as item_status,
    line_item.l_receiptdate as item_delivery_date,
    line_item.l_shipmode as item_ship_mode

from orders

left join line_item on orders.o_orderkey = line_item.l_orderkey
