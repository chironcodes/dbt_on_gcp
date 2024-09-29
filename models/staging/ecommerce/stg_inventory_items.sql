with source as (
      select * from {{ source('public_ecommerce', 'inventory_items') }}
),
renamed as (
    select
        {{ adapter.quote("id") }} AS inventory_item_id,
        {{ adapter.quote("product_id") }} AS product_id,
        {{ adapter.quote("created_at") }} AS created_at,
        {{ adapter.quote("sold_at") }} AS sold_at,
        {{ adapter.quote("cost") }} AS cost,
        {{ adapter.quote("product_category") }} AS product_category,
        {{ adapter.quote("product_name") }} AS product_name,
        {{ adapter.quote("product_brand") }} AS product_brand,
        {{ adapter.quote("product_retail_price") }} AS product_retail_price,
        {{ adapter.quote("product_department") }} AS product_department,
        {{ adapter.quote("product_sku") }} AS product_sku,
        {{ adapter.quote("product_distribution_center_id") }} AS product_distribution_center_id

    from source
)
select * from renamed
  