%% load an image
image_rgb = imread("Teinte.jpg");

%% transfert to hsv
image_hsv = rgb2hsv(image_rgb);

%% displaying the image
figure(1)
subplot(2, 2, 1);
imshow(image_rgb);
subplot(2, 2, 2);
imshow(image_hsv(:,:,1));
subplot(2, 2, 3);
imshow(image_hsv(:,:,2));
subplot(2, 2, 4);
imshow(image_hsv(:,:,3));

%% building the HSV color space image
image_q6 = ones(100, 300, 3);
for i = 1:100
    for j = 1:300
        image_q6(i, j, 1) = j / 300; %horizontal linear scale on hue
        image_q6(i, j, 2) = i / 100; %vertical linear scale on saturation
        image_q6(i, j, 3) = 1; %minimal value
    end
end

%% dispalying the HSV color space
figure(2)
image_q6_rgb = hsv2rgb(image_q6);
imshow(image_q6_rgb);