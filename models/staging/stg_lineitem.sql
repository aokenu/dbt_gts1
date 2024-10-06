-- CTE to fetch data from source 

with line_item as (   
     
select *

from {{ source('dbt_gts',  'lineitem') }}

)


-- get data from the CTE
select * from line_item
