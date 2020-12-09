# -*- coding: utf-8 -*-
"""
BE Computer Vision 1

Thomas Bellier
Nathan Magnan
Noé Clément
"""

import matplotlib.pyplot as plt
import numpy as np
import cv2
from scipy import ndimage

save = False
questions = [13,14,15]

"""
Question 13
"""

img = plt.imread('Stripes.png')

f = np.fft.fft2(img)
f_shift = np.fft.fftshift(f)
f_abs = np.abs(f_shift) + 1 # lie between 1 and 1e6
f_bounded = np.log(f_abs)
f_img = 255 * f_bounded / np.max(f_bounded)
f_img = f_img.astype(np.uint8)
if 13 in questions:
    plt.figure(1)
    plt.imshow(f_img, cmap='gray')
if save:
    plt.imsave("Stripes_FT.png", f_img, cmap='gray')

"""
Question 14
"""

box_blur = cv2.blur(img, (3,3))

f = np.fft.fft2(box_blur)
f_shift = np.fft.fftshift(f)
f_abs = np.abs(f_shift) + 1 # lie between 1 and 1e6
f_bounded = np.log(f_abs)
f_box_blur = 255 * f_bounded / np.max(f_bounded)
f_box_blur = f_box_blur.astype(np.uint8)

gaussian_blur = cv2.GaussianBlur(img,(5,5),0)

f = np.fft.fft2(gaussian_blur)
f_shift = np.fft.fftshift(f)
f_abs = np.abs(f_shift) + 1 # lie between 1 and 1e6
f_bounded = np.log(f_abs)
f_gaussian_blur = 255 * f_bounded / np.max(f_bounded)
f_gaussian_blur = f_gaussian_blur.astype(np.uint8)

if 14 in questions:
    plt.figure(2)
    plt.imshow(box_blur, cmap='gray')
    plt.figure(3)
    plt.imshow(f_box_blur, cmap='gray')
    plt.figure(4)
    plt.imshow(gaussian_blur, cmap='gray')
    plt.figure(5)
    plt.imshow(f_gaussian_blur, cmap='gray')
if save:
    plt.imsave("Stripes_blur_FT.png", f_box_blur, cmap='gray')
    plt.imsave("Stripes_gaussian_blur_FT.png", f_gaussian_blur, cmap='gray')

"""
Question 15
"""

img_color = plt.imread('champs.bmp')
img = cv2.cvtColor(img_color, cv2.COLOR_BGR2GRAY)

stripe1 = np.ones((2,40))
stripe2 = np.zeros((2,40))
stripe = np.concatenate((stripe1,stripe2))
pattern = np.concatenate([stripe]*10)
pattern = ndimage.rotate(pattern, 56, reshape=False)
pattern = pattern[len(pattern)//4:3*len(pattern)//4,len(pattern)//4:3*len(pattern)//4]
pattern = pattern - np.mean(pattern)

champs = abs(cv2.filter2D(img, cv2.CV_64F, pattern))
champs = cv2.GaussianBlur(champs,(9,9),0)
mask = champs > 3.5*np.mean(champs)
final = np.zeros((len(img),len(img[0]),3))
for i in range(len(img)):
    for j in range(len(img[0])):
        if mask[i][j]:
            final[i][j] = img_color[i][j]/255

if 15 in questions:
    plt.figure(6)
    plt.imshow(pattern, cmap='gray')
    plt.figure(7)
    plt.imshow(champs, cmap='gray')
    plt.figure(8)
    plt.imshow(final)
if save:
    plt.imsave("pattern.png", pattern, cmap='gray')
    plt.imsave("champs.png", champs, cmap='gray')
    plt.imsave("final.png", final)