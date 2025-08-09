import pandas as pd
import sys

# Lấy giá trị biến môi trường
source_file = sys.argv[1]
csv_file = sys.argv[2]

# Đọc file parquet
df = pd.read_parquet(source_file)

# Ghi ra file CSV
df.to_csv(csv_file, index=False)
print(f"Shape của df: {df.shape}")
