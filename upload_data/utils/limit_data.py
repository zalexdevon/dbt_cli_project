import pandas as pd
import sys

# Get param
source_file = sys.argv[1]
source_file_limited = sys.argv[2]
limit_num_row = int(sys.argv[3])

# Read file
df = pd.read_parquet(source_file)

# Take 10000 rows
df = df.head(limit_num_row)

# Save file
df.to_parquet(source_file_limited, engine="pyarrow")
