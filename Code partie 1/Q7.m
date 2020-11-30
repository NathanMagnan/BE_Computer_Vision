%% load an image
image_rgb = imread("Teinte.jpg");

%% get the true greyscale image
image_grey_true = rgb2gray(image_rgb);

%% get the approximate rgb
image_grey_false = 0.26 .* image_rgb(:,:,1) + 0.60 .* image_rgb(:,:,2) + 0.14 .* image_rgb(:,:,3);

%% compare the 3 greyscale images
figure(1)
subplot(1, 2, 1);
imshow(int8(image_grey_true));
subplot(1, 2, 2);
imshow(int8(image_grey_false));