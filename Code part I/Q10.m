%% load the image
image_beach = imread("SpainBeach.jpg");

%% diplay the image
figure(1);
imshow(image_beach);

%% create a new image with pixels in the right range
s=size(image_beach);
image_q10 = zeros(s(1), s(2));

for i = 1:s(1)
    for j = 1:s(2)
        image_q10(i, j) = 255;
        if (image_beach(i, j, 1) > 150) && (image_beach(i, j, 3) < 120)
            image_q10(i, j) = 0;
        end
    end
end

%% dispay the new image
figure(2);
imshow(image_q10);
