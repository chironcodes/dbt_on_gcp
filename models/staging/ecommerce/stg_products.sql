with source as (
      select * from {{ source('public_ecommerce', 'products') }}
),
renamed as (
    select
        {{ adapter.quote("id") }} AS product_id,
        {{ adapter.quote("cost") }} AS cost,
        {{ adapter.quote("category") }} AS category,
        {{ adapter.quote("name") }} AS name,
        {{ adapter.quote("brand") }} AS brand,
        {{ adapter.quote("retail_price") }} AS retail_price,
        {{ adapter.quote("department") }} AS department,
        {{ adapter.quote("sku") }} AS sku,
        {{ adapter.quote("distribution_center_id") }} AS distribution_center_id

    from source
)
select * from renamed
  