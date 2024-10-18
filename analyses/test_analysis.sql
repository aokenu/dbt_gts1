WITH tests AS (
    SELECT * 
    FROM {{ ref('stg_lineitem') }} 
    LIMIT 100
)


SELECT * FROM tests;
