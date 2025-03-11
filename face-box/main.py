import cv2
import os

cmd_dir = os.path.dirname(os.path.abspath(__file__))
out_path = os.path.join(cmd_dir, "output.jpg")

while True:
    img_path = input()
    img = cv2.imread(img_path)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    edges = cv2.Canny(gray, 50, 150)
    cv2.imwrite(out_path, edges)
    print(out_path)
