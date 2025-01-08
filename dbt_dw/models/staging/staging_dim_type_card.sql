
SELECT
    ROW_NUMBER() OVER () AS type_id,
    type
FROM (
    SELECT DISTINCT type
    FROM `dbt-dw-445421`.dw.completedcard
) AS distinct_types
