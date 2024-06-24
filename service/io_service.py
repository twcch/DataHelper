from abc import ABC, abstractclassmethod


class IOService(ABC):
    
    @abstractclassmethod
    def input_csv_to_dataframe(self, src, sep, encoding):
        pass
    
    @abstractclassmethod
    def output_excel_from_dataframe(self, desc, dataframe):
        pass