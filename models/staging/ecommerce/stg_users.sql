with source as (
      select * from {{ source('public_ecommerce', 'users') }}
),
renamed as (
    select
        {{ adapter.quote("id") }} AS user_id,
        {{ adapter.quote("first_name") }} AS first_name,
        {{ adapter.quote("last_name") }} AS last_name,
        {{ adapter.quote("email") }} AS email,
        {{ adapter.quote("age") }} AS age,
        {{ adapter.quote("gender") }} AS gender,
        {{ adapter.quote("state") }} AS state,
        {{ adapter.quote("street_address") }} AS street_address,
        {{ adapter.quote("postal_code") }} AS postal_code,
        {{ adapter.quote("city") }} AS city,
        {{ adapter.quote("country") }} AS country,
        {{ adapter.quote("latitude") }} AS latitude,
        {{ adapter.quote("longitude") }} AS longitude,
        {{ adapter.quote("traffic_source") }} AS traffic_source,
        {{ adapter.quote("created_at") }} AS created_at

    from source
)
select * from renamed
  