{{ config(enabled = false) }}

select
    o_custkey,
    avg(o_totalprice) as average_amount
from {{ ref('stg_orders') }}
group by 1
having count(o_custkey) > 1 and average_amount < 1