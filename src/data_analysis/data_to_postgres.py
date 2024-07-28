import pandas as pd
from src.util.path.local_path import LocalPath
from src.util.postgres.dataframe_and_postgres import DataframeAndPostgres

local_path = LocalPath()
src = local_path.get_download_folder() + "/e_commerce.csv"

data = pd.read_csv(src)

dataframe_and_postgres = DataframeAndPostgres()
dataframe_and_postgres.dataframe_to_postgres("e_commerce", data)


