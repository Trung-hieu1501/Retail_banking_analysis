select 
    distinct(l.loan_id) as loan_id, 
    l.account_id, 
    l.amount, 
    l.duration,
    l.location,
    d.date_id,
    p.purpose_id
from (
    select 
        loan_id,
        cast(substring(account_id, 2) as int) as account_id,
        amount,
        duration,
        location,
        DATE(date) as date,
        purpose
    from {{ ref('staging_fact_loan') }}
) l
join {{ ref('dim_account') }} a
    on l.account_id = a.account_id
join {{ ref('dim_date') }} d
    on l.date = d.date_id
join {{ ref('dim_purpose') }} p
    on l.purpose = p.purpose
-- group by l.loan_id, l.account_id, l.amount, l.duration, l.location, d.date_id, p.purpose_id
