%% load image
image_stars = rgb2gray(imread("Etoiles.png"));

%% apply the filters
im_int_1 = wiener2(image_stars, [20 20]); %% reduces the noise very well

h_2 = fspecial('disk', 15); %% spreads the stars, so that small stars disappear
im_int_2 = imfilter(im_int_1, h_2);

im_q12 = ad_hoc_filter(im_int_2, 170);

%% display the images
figure(1);
subplot(1, 2, 1);
imshow(image_stars);
subplot(1, 2, 2);
imshow(im_q12);