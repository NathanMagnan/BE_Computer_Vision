%% load image
image_color = imread("cargo.jpg");

%% display color image
figure(1);
imshow(image_color);

%% dispay greyscale image
image_grey = rgb2gray(image_color);
figure(2);
imshow(image_grey);