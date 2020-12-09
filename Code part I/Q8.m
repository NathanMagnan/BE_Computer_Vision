%% load the 2 images
image_beach = imread("SpainBeach.jpg");
image_toulouse = imread("toulouse.bmp");

%% plot the image and the histogram of the beach image
figure(1)
subplot(1,2,1);
imshow(rgb2gray(image_beach));
subplot(1,2,2);
imhist(rgb2gray(image_beach));