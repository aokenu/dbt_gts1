select
    o_orderkey
from {{ ref('stg_orders') }}
group by 1
having count(o_orderkey) > 1