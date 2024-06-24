from controller.care_report_controller import CareReportController


def main():
    
    src = "C:/Users/B1997/Desktop/f_care_report_202406_2st.txt"
    desc = "C:/Users/B1997/Desktop/text.xlsx"
    care_report_controller = CareReportController()
    care_report_controller.report_generator_v1(src, desc)


if __name__ == "__main__":
    main()
