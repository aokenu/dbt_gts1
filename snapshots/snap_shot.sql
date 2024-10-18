{% snapshot my_snapshot %}

    {{
        config(
            target_schema='gts_schema',
            unique_key='l_orderkey',
            strategy='timestamp',
            updated_at='l_receiptdate'
        )
    }}

    select * from {{ source('dbt_gts', 'lineitem')}}


{% endsnapshot %}