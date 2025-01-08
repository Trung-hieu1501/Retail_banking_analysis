with age_data as (
    select
        row_number() over () as age_id, -- Tự tạo age_id
        age,
        case
            when age >= 12 and age <= 20 then 'Teenage age'
            when age > 20 and age <= 30 then 'Age at starting career'
            when age > 30 and age <= 60 then 'Age of financial stability'
            when age > 60 and age <= 88 then 'Retirement age'
            else 'Out of range'
        end as age_group
    from unnest(generate_array(12, 88)) as age -- Tạo dãy số từ 13 đến 88
)

select *
from age_data
