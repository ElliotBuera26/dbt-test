with source as (

    select * from {{ source('raw', 'orders') }}

),

renamed as (

    select
        order_id,
        customer_id,
        product_id,
        order_date,
        quantity,
        order_status
    from source

)

select * from renamed