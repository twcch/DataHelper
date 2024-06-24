import pandas as pd
import numpy as np

from service.dataframe_service import DataframeService


class DataframeServiceImpl(DataframeService):
    
    def merge_column_to_new_column_if_none(self, dataframe, main_column, sub_column, new_column):
        
        dataframe[new_column] = np.nan
        
        for rows in range(dataframe.shape[0]):
            if pd.isnull(dataframe[main_column].iloc[rows]) == False:
                dataframe[new_column].iloc[rows] = dataframe[main_column].iloc[rows]
            elif pd.isnull(dataframe[sub_column].iloc[rows]) == False:
                dataframe[new_column].iloc[rows] = dataframe[sub_column].iloc[rows]
            else:
                dataframe[new_column].iloc[rows] = np.nan
        
        return dataframe
    
    def merge_column_to_new_column_if_empty(self, dataframe, main_column, sub_column, new_column):
        
        dataframe[new_column] = ""
        
        for rows in range(dataframe.shape[0]):
            if dataframe[main_column].iloc[rows] != "":
                dataframe[new_column].iloc[rows] = dataframe[main_column].iloc[rows]
            elif dataframe[sub_column].iloc[rows] != "":
                dataframe[new_column].iloc[rows] = dataframe[sub_column].iloc[rows]
            else:
                dataframe[new_column].iloc[rows] = ""
        
        return dataframe
    
    def set_column_type(self, dataframe, column_name_list, column_type):
        
        for columns in dataframe.columns:
            if columns in column_name_list:
                dataframe[columns] = dataframe[columns].astype(column_type)
        
        return dataframe
    
    def trim_string(self, dataframe, column_name_list):
        
        for columns in dataframe.columns:
            if columns in column_name_list:
                dataframe[columns] = dataframe[columns].str.strip()
        
        return dataframe
    
    def replace_data(self, dataframe, column_name_list, old_value, new_value):
        
        for columns in dataframe.columns:
            if columns in column_name_list:
                dataframe[columns] = dataframe[columns].replace({old_value: new_value})
        
        return dataframe
    
    def drop_column(self, dataframe, column_name_list):
        
        for columns in dataframe.columns:
            if columns in column_name_list:
                dataframe = dataframe.drop(columns, axis=1)
        
        return dataframe

    def drop_data_duplicate(self, dataframe):
        
        data = dataframe.drop_duplicates()
        
        return data