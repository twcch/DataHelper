import pandas as pd
from sqlalchemy import create_engine


class DataframeAndMysql():

    def __init__(self,
                 database_name="mysql_data",
                 username="dba",
                 password="123456",
                 hostname="localhost",
                 port="3306"):
        self.__database_name = database_name
        self.__username = username
        self.__password = password
        self.__hostname = hostname
        self.__port = port
        self.__database_url = f"mysql+pymysql://{self.__username}:{self.__password}@{self.__hostname}:{self.__port}/{self.__database_name}"
        self.__engine = create_engine(self.__database_url)

    def dataframe_to_mysql(self, table_name, dataframe, if_exists="replace", index=False):
        dataframe.to_sql(table_name, self.__engine, if_exists=if_exists, index=index)

    def dataframe_from_mysql(self, table_name):
        dataframe = pd.read_sql(table_name, self.__engine)
        return dataframe

    def get_database_name(self):
        return self.__database_name

    def get_username(self):
        return self.__username

    def get_password(self):
        return self.__password

    def get_hostname(self):
        return self.__hostname

    def get_port(self):
        return self.__port

    def get_database_url(self):
        return self.__database_url

    def get_engine(self):
        return self.__engine