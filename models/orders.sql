{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

with orders as (

    select *
    {% if var('include_missing_models', false) %}
    from {{ ref('stg_orders') }}
    {% else %}
    from {{ ref('stg_customers') }}
    {% endif %}


),

payments as (

    select *
    {% if var('include_missing_models', false) %}
    from {{ ref('stg_payments') }}
    {% else %}
    from {{ ref('stg_customers') }}
    {% endif %}

),

order_payments as (

    select
        order_id,
        sum(case when payment_method = 'credit_card' then amount else 0 end) as credit_card_amount,
        sum(case when payment_method = 'coupon' then amount else 0 end) as coupon_amount,
        sum(amount) as total_amount

    from payments

    group by order_id

),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,

        order_payments.credit_card_amount,
        order_payments.coupon_amount,

        order_payments.total_amount as amount

    from orders


    left join order_payments
        on orders.order_id = order_payments.order_id

)

select * from final
