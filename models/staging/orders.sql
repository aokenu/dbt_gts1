select

    *

from

{{ source('dbt_gts', 'orders') }}