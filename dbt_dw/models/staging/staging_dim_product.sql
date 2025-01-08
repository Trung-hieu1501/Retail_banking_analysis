SELECT
    ROW_NUMBER() OVER () AS product_id,
    product,
    sub_product
FROM (
    SELECT DISTINCT product, sub_product
    FROM `dbt-dw-445421`.dw.crm_events
) AS distinct_products
