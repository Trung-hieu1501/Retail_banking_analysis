SELECT
    ROW_NUMBER() OVER () AS operation_id,
    operation
FROM (
    SELECT DISTINCT operation
    FROM `dbt-dw-445421`.dw.completedtrans
) AS distinct_operation