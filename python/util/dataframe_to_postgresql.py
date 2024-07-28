import pandas as pd
from sqlalchemy import create_engine


data = pd.read_csv("/Users/twcch/Documents/Drive/40. 商業分析/作品/Health insurance data set.csv")

database_url = "postgresql://dba:123456@localhost:5432/postgres_data"
engine = create_engine(database_url)

data.to_sql("health_insurance_data", engine, if_exists="replace", index=False)