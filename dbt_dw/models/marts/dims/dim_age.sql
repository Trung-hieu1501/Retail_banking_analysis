
SELECT
    ROW_NUMBER() OVER () AS age_id,
    age_group
FROM (
    SELECT DISTINCT age_group
    FROM {{ref('staging_dim_age')}}
) AS distinct_age
