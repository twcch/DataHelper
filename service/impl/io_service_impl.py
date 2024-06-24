import pandas as pd

from service.io_service import IOService

class IOServiceImpl(IOService):
    
    def input_csv_to_dataframe(self, src, sep="\t", encoding="ANSI"):
        
        data = pd.read_csv(src, sep=sep, encoding=encoding, low_memory=False)
        
        return data
    
    def output_excel_from_dataframe(self, desc, dataframe, index=False):
        
        dataframe.to_excel(desc, index=index)