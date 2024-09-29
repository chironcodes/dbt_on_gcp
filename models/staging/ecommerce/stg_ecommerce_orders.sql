with source as (
      select * from {{ source('public_ecommerce', 'orders') }}
),
renamed as (
    select
        {{ adapter.quote("order_id") }} AS order_id,
        {{ adapter.quote("user_id") }} AS user_id,
        {{ adapter.quote("status") }} AS status,
        {{ adapter.quote("gender") }} AS gender,
        {{ adapter.quote("created_at") }} AS created_at,
        {{ adapter.quote("returned_at") }} AS returned_at,
        {{ adapter.quote("shipped_at") }} AS shipped_at,
        {{ adapter.quote("delivered_at") }} AS delivered_at,
        {{ adapter.quote("num_of_item") }} AS num_of_item

    from source
)
select * from renamed
  