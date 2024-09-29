WITH source AS (
    SELECT * FROM {{ source('public_ecommerce', 'distribution_centers') }}
),

renamed as (
    select
        {{ adapter.quote("id") }} AS id_dcenter,
        {{ adapter.quote("name") }} AS name_center,
        {{ adapter.quote("latitude") }} AS geo_lat,
        {{ adapter.quote("longitude") }} AS geo_long

    from source
)
select * from renamed