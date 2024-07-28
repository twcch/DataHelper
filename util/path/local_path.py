class LocalPath():

    def __init__(self):
        self.__user_folder = "/User/twcch"
        self.__download_folder = "/Users/twcch/Downloads"

    def get_user_folder(self):
        return self.__user_folder

    def get_download_folder(self):
        return self.__download_folder