select 
    c.disp_id, 
    c.card_id, 
    c.date, 
    tc.type_id
from (
    select 
        cast(substring(disp_id, 2) as int) as disp_id,
        cast(substring(card_id, 2) as int) as card_id,
        date,
        type 
    from {{ ref('staging_dim_card') }}
) c
join {{ ref('dim_type_card') }} tc
    on c.type = tc.type
join {{ ref('dim_date') }} d
    on c.date = d.date_id
group by c.disp_id, c.card_id, c.date, tc.type_id
