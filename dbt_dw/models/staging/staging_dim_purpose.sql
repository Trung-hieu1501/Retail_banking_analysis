SELECT
    ROW_NUMBER() OVER () AS purpose_id,
    purpose
FROM (
    SELECT DISTINCT purpose
    FROM `dbt-dw-445421`.dw.completedloan
) AS distinct_purpose
