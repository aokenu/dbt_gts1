select  
    amount
from {{ ref('int_order_items') }}
where amount <= 0