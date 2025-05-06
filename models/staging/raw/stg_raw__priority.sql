with 

source as (

    select * from {{ source('raw', 'priority') }}

),

renamed as (

    select
        compny_name,
        priority

    from source

)

select * from renamed
