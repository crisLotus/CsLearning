import numpy as np
import image as img
import imgdata as data

hmat = img.readTheta()

count = len(data.images)
yes = 0
for image,expect in zip(data.images,data.target):
    predict = img.h(hmat, image)
    maxn = 0
    for p,c in zip(np.array(predict)[0],data.category):
        if maxn<p:
            char = c
            maxn = p
    if char==expect:
        yes += 1
    else:
        print(char,expect,'no')
print(yes*1.0/count)
