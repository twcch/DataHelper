from service.dataframe_service import DataframeService


class DataframeServiceImpl(DataframeService):
    
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