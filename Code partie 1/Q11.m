%% load the images
image_stripes = imread("Stripes.png");
image_real = imread("toulouse.bmp");

%% apply blur filtering
h_blur = fspecial('average');
image_stripes_blurred = imfilter(image_stripes, h_blur);
image_real_blurred = imfilter(image_real, h_blur);


%% apply Edge filtering
h_edges = fspecial('Laplacian', 0);
image_stripes_edges = imfilter(image_stripes, h_edges);
image_real_edges = imfilter(image_real, h_edges);

%% display the images
figure(1);
imshow(image_stripes);
figure(2);
imshow(image_real);
figure(3);
imshow(image_stripes_blurred);
figure(4);
imshow(image_real_blurred);
figure(5);
imshow(image_stripes_edges);
figure(6);
imshow(image_real_edges);

%% apply both filters on the real image
h_1 = fspecial('average', 2);
image_intermediate = imfilter(image_real, h_1);
h_2 = fspecial('Laplacian', 0);
image_q11 = imfilter(image_intermediate, h_2);

figure(7);
imshow(image_q11);
