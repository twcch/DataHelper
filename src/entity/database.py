class Database():

    def __init__(self):
        self.database_name = None
        self.username = None
        self.password = None
        self.hostname = None
        self.port = None

    def get_database_name(self):
        return self.database_name

    def set_database_name(self, database_name):
        self.database_name = database_name

    def get_username(self):
        return self.username

    def set_username(self, username):
        self.username = username

    def get_password(self):
        return self.password

    def set_password(self, password):
        self.password = password

    def get_hostname(self):
        return self.hostname

    def set_hostname(self, hostname):
        self.hostname = hostname

    def get_port(self):
        return self.port

    def set_port(self, port):
        self.port = port