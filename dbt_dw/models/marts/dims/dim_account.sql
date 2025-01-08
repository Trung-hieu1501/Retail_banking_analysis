select 
    distinct(a.account_id) as account_id, 
    a.district_id, 
    f.frequency_id, 
    a.date
from (
    select 
        cast(substring(account_id, 2) as int) as account_id,
        district_id,
        frequency, 
        date
    from {{ ref('staging_dim_account') }}
) a
join {{ ref('dim_frequency') }} f
    on a.frequency = f.frequency
join {{ ref('dim_district') }} d 
    on a.district_id = d.district_id
join {{ ref('dim_date') }} da
    on a.date = da.date_id
