with date_series as (
    select
        date_add('2011-01-01', interval n day) as date_id
    from unnest(generate_array(0, date_diff('2017-12-31', '2011-01-01', day))) as n
),

date_details as (
    -- Extract day, week, month, quarter, and year from the generated dates
    select
        date_id ,
        extract(day from date_id) as day,
        extract(week from date_id) as week,
        extract(month from date_id) as month,
        extract(quarter from date_id) as quarter,
        extract(year from date_id) as year
    from date_series
)

-- Final output
select * from date_details

