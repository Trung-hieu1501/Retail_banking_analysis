SELECT
    ROW_NUMBER() OVER () AS bank_id,
    bank
FROM (
    SELECT DISTINCT bank
    FROM `dbt-dw-445421`.dw.completedtrans
) AS distinct_bank