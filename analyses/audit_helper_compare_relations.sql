-- use this set if you are comparing to another dbt model

{% set old_etl_relation=ref('stg_lineitem') %}

-- this is your newly built dbt model 

{% set dbt_relation=ref('fct_orders') %}

{{ audit_helper.compare_relations(
    a_relation=old_etl_relation,
    b_relation=dbt_relation,
    primary_key="order_id"
) }}