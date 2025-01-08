
SELECT
    ROW_NUMBER() OVER () AS frequency_id,
    frequency
FROM (
    SELECT DISTINCT frequency
    FROM `dbt-dw-445421`.dw.completedacct
) AS distinct_frequency
