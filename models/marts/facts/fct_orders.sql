-- Aggregate measures
with 

order_item_measures as (
    select
        order_id,
        count(order_id) as total_orders,
        count(item_id) as total_item_sold,
        count(distinct customerid) as count_of_customer,
        sum(amount) as total_amount,
        order_date as order_created_at,
        item_delivery_date as order_delivered_at
    
    from {{ ref('int_order_items') }}

    group by order_id, order_date, item_delivery_date
)




select
    -- Aggregated values
    avg(o.l_discount) as avg_discount,
    
    -- Non-aggregated columns (must be included in GROUP BY)
    o.l_shipdate as order_shipped_at,
    o.l_commitdate as order_committed_at,
    
    -- Measures from order_item_measures
    om.order_id,
    om.order_created_at,
    om.order_delivered_at,
    om.total_orders,
    om.total_item_sold,
    om.count_of_customer,
    om.total_amount

from {{ ref('stg_lineitem') }} as o

left join order_item_measures as om
    on o.l_orderkey = om.order_id

-- Group by non-aggregated columns
group by
    o.l_shipdate,
    o.l_commitdate,
    om.order_id,
    om.order_created_at,
    om.order_delivered_at,
    om.total_orders,
    om.total_item_sold,
    om.count_of_customer,
    om.total_amount
 