select 
    distinct(d.disp_id), 
    d.client_id, 
    d.account_id, 
    d.type
from (
    select 
        cast(substring(disp_id, 2) as int) as disp_id,
        cast(substring(account_id, 2) as int) as account_id,
        client_id,
        type 
    from {{ ref('staging_dim_disposition') }}
) d
join {{ ref('dim_client') }} c
    on d.client_id = c.client_id
join {{ ref('dim_account') }} a
    on a.account_id = d.account_id
