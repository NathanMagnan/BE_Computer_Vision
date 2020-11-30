%% create black and white stripes
black_stripe = zeros(1, 255);
white_stripe = 255 .* ones(1, 255);

%% create the matrix by randomly choosing the width of the stripes
image_q3 = zeros(255, 255);
 for i = 1:255
    r = rand(1);
    if (r > 0.5)
        image_q3(i, 1:255) = black_stripe;
    else
        image_q3(i, 1:255) = white_stripe;
    end
 end
 
 %% display the image
 figure(1)
 imshow(int8(image_q3));