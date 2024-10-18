-- this generic test checks if a particular column has any null value

{% test null_values(model, column_name) %}
    select 
        {{ column_name }}
    from {{ model }}
    where {{ column_name }} is null
{% endtest %}