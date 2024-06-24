from service.impl.io_service_impl import IOServiceImpl
from service.impl.dataframe_service_impl import DataframeServiceImpl


class CareReportController():
    
    def report_generator_v1(self, src, desc):
        
        print("start care report generator v1 ...")
        
        # read data
        io_service_impl = IOServiceImpl()
        data = io_service_impl.input_csv_to_dataframe(src)
        
        # set column type and trim string
        dataframe_service_impl = DataframeServiceImpl()
        
        column_name_list = ["ACCID_ID", "RGST_CODE", "RGST_NO", "POLICY_NO", "POLICY_SEQ", "ID_DUP", "SEQ_NO", "ITEM", "CLAIM_ITEM", "MOP", "DD_CLASS", "APPLY_NO", 
                       "RGST_NO01", "ACCID_NAME", "APPLY_ID", "APPLY_UNIT", "AREA_CODE", "CNCT_STAT", "CNCT_STA01", "ACDN_NAME", "CL_TEXT", "TEL_NO", "EMPY_NAME", 
                       "MOBILE", "ADAAI1", "ADAOC1", "ADA2C1", "PAID_ID", "PAID_NAME", "BANK_NO", "BANK_ACT", "SHR_BQ", "ADDR", "TEL", "DECL_YN", "CLAIM_NAME", 
                       "DFYN_TAB"]
        data = dataframe_service_impl.set_column_type(data, column_name_list, "str")
        data = dataframe_service_impl.trim_string(data, column_name_list)
        
        column_name_list = ["ATTN_YY", "ATTN_MM", "ATTN_DD", "GIVE_YY", "GIVE_MM", "GIVE_DD", "EFF_TIMES", "IPAY_TIMES", "GRTE_TIMES", "EFF_YY", "EFF_MM", "EFF_DD", 
                       "EXPR_YY", "EXPR_MM", "EXPR_DD", "ATTN_YY01", "ATTN_MM01", "ATTN_DD01", "GIVE_YY01", "GIVE_MM01", "GIVE_DD01", "BIRTH_YY", "BIRTH_MM", 
                       "BIRTH_DD", "ACDN_YY", "ACDN_MM", "ACDN_DD"]
        data = dataframe_service_impl.set_column_type(data, column_name_list, "int")
        
        column_name_list = ["CLAIM_AMT"]
        data = dataframe_service_impl.set_column_type(data, column_name_list, "float")
        
        # replace data
        column_name_list = ["ATTN_YY", "ATTN_MM", "ATTN_DD", "GIVE_YY", "GIVE_MM", "GIVE_DD", "EFF_YY", "EFF_MM", "EFF_DD", "EXPR_YY", "EXPR_MM", "EXPR_DD", 
                            "ATTN_YY01", "ATTN_MM01", "ATTN_DD01", "GIVE_YY01", "GIVE_MM01", "GIVE_DD01", "BIRTH_YY", "BIRTH_MM", "BIRTH_DD", "ACDN_YY", 
                            "ACDN_MM", "ACDN_DD"]
        data = dataframe_service_impl.replace_data(data, column_name_list, 0, "")
        
        # merge column
        data = dataframe_service_impl.merge_column_to_new_column_if_empty(data, "CNCT_STAT", "CNCT_STA01", "NEW_CNCT_STAT")
        data = dataframe_service_impl.merge_column_to_new_column_if_empty(data, "EMPY_NAME", "ADAAI1", "NEW_EMPY_NAME")
        data = dataframe_service_impl.merge_column_to_new_column_if_empty(data, "MOBILE", "ADAOC1", "NEW_MOBILE")
        
        # drop column
        column_name_list = ["Unnamed: 65"]
        data = dataframe_service_impl.drop_column(data, column_name_list)
        
        # output data
        io_service_impl.output_excel_from_dataframe(desc, data)
        
        print("end care report generator v1 ...")