UPDATE {{table}}
SET 
unique_row_id = md5(
    COALESCE(CAST(VendorID AS text), '') ||
    COALESCE(CAST(tpep_pickup_datetime AS text), '')
),
filename = '{{source_file}}';