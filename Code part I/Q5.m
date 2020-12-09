%% making the stripes
% dimensions ratio 2:3
% blue RGB = (0, 85, 164)
% white RGB = (255, 255, 255)
% red RGB = (239, 65, 53)
% accroding to wikipedia

blue_stripe = ones(200, 100, 3);
blue_stripe(:,:,1) = 0;
blue_stripe(:,:,2) = 85;
blue_stripe(:,:,3) = 164;

white_stripe = ones(200, 100, 3);
white_stripe(:,:,1) = 255;
white_stripe(:,:,2) = 255;
white_stripe(:,:,3) = 255;

red_stripe = ones(200, 100, 3);
red_stripe(:,:,1) = 239;
red_stripe(:,:,2) = 65;
red_stripe(:,:,3) = 53;

%% making a single image
image_q4 = [blue_stripe white_stripe red_stripe];

%% displaying the image
figure(1)
imshow(image_q4)