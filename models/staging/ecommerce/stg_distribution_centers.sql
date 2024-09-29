WITH source AS (
    SELECT * FROM {{ source('public_ecommerce', 'distribution_centers') }}
),

renamed as (
    select
        {{ adapter.quote("id") }} AS distribution_center_id,
        {{ adapter.quote("name") }} AS name,
        {{ adapter.quote("latitude") }} AS latitude,
        {{ adapter.quote("longitude") }} AS longitude

    from source
)
select * from renamed