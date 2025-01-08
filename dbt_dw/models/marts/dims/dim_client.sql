select 
    c.client_id, 
    a.age_id, 
    c.district_id, 
    c.sex
from (
    select 
        cast(substring(client_id, 2) as int) as client_id,
        case
            when age >= 12 and age <= 20 then 'Teenage age'
            when age > 20 and age <= 30 then 'Age at starting career'
            when age > 30 and age <= 60 then 'Age of financial stability'
            when age > 60 and age <= 88 then 'Retirement age'
            else 'Unknown'
        end as age_group,
        district_id,
        sex
    from {{ ref('staging_dim_client') }}
) c
join {{ ref('dim_age') }} a 
    on c.age_group = a.age_group
join {{ ref('dim_district') }} d 
    on c.district_id = d.district_id
