import pandas as pd
import sys

# Get param
csv_file = sys.argv[1]
csv_file_limited = sys.argv[2]
limit_num_row = int(sys.argv[3])

# Read file
df = pd.read_csv(csv_file)

# Take 10000 rows
df = df.head(limit_num_row)

# Save file
df.to_csv(csv_file_limited, index=False)
