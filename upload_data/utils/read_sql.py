import os
from jinja2 import Template
from kestra import Kestra
import sys
import json

# Đọc đối số dòng lệnh đầu tiên (argv[1])
params_str = sys.argv[1]

# TODO: d
print(f"params_str: {params_str}")
# d

file_path = sys.argv[2]

# Chuyển từ JSON string → dict
params = json.loads(params_str)

with open(file_path, "r") as f:
    sql_template = Template(f.read())

sql = sql_template.render(**params)


# print(sql)
var_name = file_path.split("/")[-1].split(".")[0]
Kestra.outputs({var_name: sql})
