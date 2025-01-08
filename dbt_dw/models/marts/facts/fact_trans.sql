select 
    distinct(t.trans_id) as trans_id,
    t.account_id,
    tt.type_id,
    o.operation_id,
    b.bank_id,
    t.amount,
    t.balance,
    t.date
from (
    select 
        cast(substring(trans_id, 2) as int) as trans_id, 
        cast(substring(account_id, 2) as int) as account_id, 
        coalesce(operation, 'Unspecified Transaction') as operation, 
        coalesce(bank, 'National Bank') as bank, 
        amount,
        balance,
        type,
        date
    from {{ ref('staging_fact_trans') }}
) t
join {{ ref('dim_account') }} a
    on t.account_id = a.account_id
join {{ ref('dim_date') }} d
    on t.date = d.date_id
join {{ ref('dim_typetrans') }} tt
    on t.type = tt.type
join {{ ref('dim_operation') }} o
    on t.operation = o.operation
join {{ ref('dim_bank') }} b
    on t.bank = b.bank
