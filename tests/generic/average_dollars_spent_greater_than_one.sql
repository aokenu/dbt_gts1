{% test average_dollars_spent_greater_than_one(model, column_name) %}

select
    o_custkey,
    avg({{ column_name }}) 
from {{ model }}
group by 1
having count(o_custkey) > 1 and avg({{ column_name }}) < 1

{% endtest %}
