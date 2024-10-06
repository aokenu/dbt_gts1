-- CTE to fetch data from source 
with orders as (
    
select  *

from {{ source('dbt_gts', 'orders') }}

)


-- get data from the CTE
select * from orders