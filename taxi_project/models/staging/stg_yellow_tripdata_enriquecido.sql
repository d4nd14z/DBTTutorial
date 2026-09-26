SELECT
    *,
    extract(year FROM tpep_pickup_datetime) AS anio,
    extract(month FROM tpep_pickup_datetime) AS mes
FROM {{ ref('stg_yellow_tripdata') }}
