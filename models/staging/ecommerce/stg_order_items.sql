with source as (
      select * from {{ source('public_ecommerce', 'order_items') }}
),
renamed as (
    select
        {{ adapter.quote("id") }} AS order_item_id,
        {{ adapter.quote("order_id") }} AS order_id,
        {{ adapter.quote("user_id") }} AS user_id,
        {{ adapter.quote("product_id") }} AS product_id,
        {{ adapter.quote("inventory_item_id") }} AS inventory_item_id,
        {{ adapter.quote("status") }} AS status,
        {{ adapter.quote("created_at") }} AS created_at,
        {{ adapter.quote("shipped_at") }} AS shipped_at,
        {{ adapter.quote("delivered_at") }} AS delivered_at,
        {{ adapter.quote("returned_at") }} AS returned_at,
        {{ adapter.quote("sale_price") }} AS sale_price

    from source
)
select * from renamed
  