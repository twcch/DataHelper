class IOUtil():

    def __init__(self):
        pass

    def read_key_file_data(self, file_path):
        data = {}
        with open(file_path, 'r') as file:
            for line in file:
                if ": " in line:
                    key, value = line.strip().split(': ')
                    data[key] = value

        return data