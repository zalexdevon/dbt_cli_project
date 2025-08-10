UPDATE {{table}}
SET 
unique_row_id = md5(
    COALESCE(CAST(VendorID AS text), '') ||
    COALESCE(CAST(lpep_pickup_datetime AS text), '')
),
filename = '{{source_file}}', 
passenger_count = CAST(passenger_count AS integer), 
payment_type = CAST(payment_type AS integer), 
trip_type = CAST(trip_type AS integer)
;