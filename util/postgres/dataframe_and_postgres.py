import pandas as pd
from sqlalchemy import create_engine


class DataFrameAndPostgres():

    def __init__(self,
                 database_name="postgres_data",
                 user="dba",
                 password="123456",
                 url="localhost",
                 port="5432"):
        self.__database_name = database_name
        self.__user = user
        self.__password = password
        self.__url = url
        self.__port = port
        self.__database_url = f"postgresql://{self.__user}:{self.__password}@{self.__url}:{self.__port}/{self.__database_name}"
        self.__engine = create_engine(self.__database_url)

    def dataframe_to_postgres(self, table_name, dataframe, if_exists="replace", index=False):
        dataframe.to_sql(table_name, self.__engine, if_exists=if_exists, index=index)

    def dataframe_from_postgres(self, table_name):
        dataframe = pd.read_sql(table_name, self.__engine)
        return dataframe

    def get_database_name(self):
        return self.__database_name

    def get_user(self):
        return self.__user

    def get_password(self):
        return self.__password

    def get_url(self):
        return self.__url

    def get_port(self):
        return self.__port

    def get_database_url(self):
        return self.__database_url

    def get_engine(self):
        return self.__engine