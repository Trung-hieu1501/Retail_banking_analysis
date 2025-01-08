select
    bank_id,
    coalesce(bank, 'National Bank') as bank
from {{ ref('staging_dim_bank') }}
