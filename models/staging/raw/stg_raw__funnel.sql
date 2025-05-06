with 

source as (

    select * from {{ source('raw', 'funnel') }}

),

renamed as (

    select
        company,
        sector,
        date_lead,
        opportunity_date AS date_opportunity,
        CAST(date_customer AS DATE) AS date_customer,
        date_lost

    from source

)

select * from renamed
