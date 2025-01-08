SELECT
    ROW_NUMBER() OVER () AS via_id,
    submitted_via
FROM (
    SELECT DISTINCT submitted_via
    FROM `dbt-dw-445421`.dw.crm_events
) AS distinct_via