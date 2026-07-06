with orders as (
    select * from {{ ref('source') }}
),

customers as (
    select * from {{ source('raw', 'customers') }}
),

products as (
    select * from {{ source('raw', 'products') }}
),

joined as (

    select
        o.order_id,
        o.order_date,
        o.order_status,
        c.customer_id,
        c.first_name,
        c.last_name,
        c.state,
        p.product_id,
        p.product_name,
        p.category,
        o.quantity,
        p.unit_price,
        o.quantity * p.unit_price as order_revenue

    from orders o
    left join customers c on o.customer_id = c.customer_id
    left join products p on o.product_id = p.product_id

)

select * from joined