# This file was made to combine all images of an invention machine into one image. Might as well keep it for future use

import os.path
from PIL import Image

# Edit the following 4 lines
count = 5
width = 5
dict = "REDACTED"
base_name = "stage"

assert count % width == 0
height = int(count / width)
img = Image.open(os.path.join(dict, base_name + "1.png"))
x, y = img.size

print("width, height:", x, y)

final_width = width * x
final_height = height * y

final_img = Image.new("RGBA", (final_width, final_height), (0, 0, 0, 0))

k = 0
for j in range(height):
    for i in range(width):
        k += 1
        if k < 0:
            img = Image.open(os.path.join(dict, base_name + "0" + str(k) + ".png"))
        else:
            img = Image.open(os.path.join(dict, base_name + str(k) + ".png"))
        print(x * i, y * j)
        final_img.paste(img, (x * i, y * j))

final_img.save(os.path.join(dict, "herb_stages.png"))
