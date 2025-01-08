select 
    c.complaint_id,
    c.client_id,
    c.date_received,
    p.product_id,
    sv.via_id
from (
    select 
        cast(substring(complaint_id, 3) as int) as complaint_id,
        client_id,
        date_received,
        product,
        submitted_via
    from {{ ref('staging_fact_complaint') }}
) c
join {{ ref('dim_client') }} dc
    on c.client_id = dc.client_id
join {{ ref('dim_date') }} d
    on cast(c.date_received as date) = d.date_id 
join {{ ref('dim_submitted_via') }} sv
    on c.submitted_via = sv.submitted_via
join {{ ref('dim_product') }} p
    on c.product = p.product
group by 
    c.complaint_id,
    c.client_id,
    c.date_received,
    p.product_id,
    sv.via_id
