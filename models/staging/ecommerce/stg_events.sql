with source as (
      select * from {{ source('public_ecommerce', 'events') }}
),
renamed as (
    select
        {{ adapter.quote("id") }} AS event_id,
        {{ adapter.quote("user_id") }} AS user_id,
        {{ adapter.quote("sequence_number") }} AS sequence_number,
        {{ adapter.quote("session_id") }} AS session_id,
        {{ adapter.quote("created_at") }} AS created_at,
        {{ adapter.quote("ip_address") }} AS ip_address,
        {{ adapter.quote("city") }} AS city,
        {{ adapter.quote("state") }} AS state,
        {{ adapter.quote("postal_code") }} AS postal_code,
        {{ adapter.quote("browser") }} AS browser,
        {{ adapter.quote("traffic_source") }} AS traffic_source,
        {{ adapter.quote("uri") }} AS uri,
        {{ adapter.quote("event_type") }} AS event_type

    from source
)
select * from renamed
  