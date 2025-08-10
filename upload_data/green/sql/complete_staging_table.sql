UPDATE {{table}}
SET 
unique_row_id = md5(
    COALESCE(CAST(VendorID AS text), '') ||
    COALESCE(CAST(lpep_pickup_datetime AS text), '')
),
filename = '{{source_file}}', 
passenger_count = CAST(CAST(NULLIF(passenger_count, '') AS numeric) AS integer), 
payment_type = CAST(CAST(NULLIF(payment_type, '') AS numeric) AS integer), 
trip_type = CAST(CAST(NULLIF(trip_type, '') AS numeric) AS integer);