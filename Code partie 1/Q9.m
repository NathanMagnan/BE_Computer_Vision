%% load images
image_1 = imread("imagex.bmp");
image_2 = imread("imagexx.bmp");

%% equilibrating the histograms
image_1_corrected = histeq(image_1);
image_2_corrected = histeq(image_2);

%% displaying the images
figure(1);
imshow(image_1_corrected);
figure(2);
imshow(image_2_corrected);
