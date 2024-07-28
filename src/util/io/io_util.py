from PIL import Image
import io


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

    def get_image_binary(self, file_path):
        with Image.open(file_path) as img:
            img_byte_arr = io.BytesIO()
            img.save(img_byte_arr, format=img.format)
            img_byte_arr = img_byte_arr.getvalue()

        return img_byte_arr

    def get_image_from_binary(self, image_binary):
        image_stream = io.BytesIO(image_binary)
        image = Image.open(image_stream)

        return image
