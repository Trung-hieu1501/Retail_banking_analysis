select 
  operation_id,
  COALESCE(operation, 'Unspecified Transaction') operation
 from {{ref ('staging_dim_operation')}}
