select

    *

from

{{ source('dbt_gts',  'lineitem') }}