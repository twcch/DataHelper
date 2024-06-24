from abc import ABC, abstractclassmethod


class DataframeService(ABC):
    
    @abstractclassmethod
    def merge_column_to_new_column_if_none(self, dataframe, main_column, sub_column, new_column):
        pass
    
    @abstractclassmethod
    def merge_column_to_new_column_if_empty(self, dataframe, main_column, sub_column, new_column):
        pass
    
    @abstractclassmethod
    def set_column_type(self, dataframe, column_name_list, column_type):
        pass
    
    @abstractclassmethod
    def trim_string(self, dataframe, column_name_list):
        pass
    
    @abstractclassmethod
    def replace_data(self, dataframe, column_name_list, old_value, new_value):
        pass
    
    @abstractclassmethod
    def drop_column(self, dataframe, column_name_list):
        pass
    
    @abstractclassmethod
    def drop_data_duplicate(self, dataframe):
        pass