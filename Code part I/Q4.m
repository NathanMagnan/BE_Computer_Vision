%% load the images
image_teinte = imread("Teinte.jpg");
image_oeil = imread("oeil.jpg");
image_cargo = imread("cargo.jpg");
%%%% we did not find the last image CoulAdd %%%%

%% displaying the first image
figure(1)
subplot(2, 2, 1);
imshow(image_teinte);
subplot(2, 2, 2);
imshow(image_teinte(:,:,1));
subplot(2, 2, 3);
imshow(image_teinte(:,:,2));
subplot(2, 2, 4);
imshow(image_teinte(:,:,3));

%% dispaying the second image
figure(2)
subplot(2, 2, 1);
imshow(image_oeil);
subplot(2, 2, 2);
imshow(image_oeil(:,:,1));
subplot(2, 2, 3);
imshow(image_oeil(:,:,2));
subplot(2, 2, 4);
imshow(image_oeil(:,:,3));

%% dispaying the third image
figure(3)
subplot(2, 2, 1);
imshow(image_cargo);
subplot(2, 2, 2);
imshow(image_cargo(:,:,1));
subplot(2, 2, 3);
imshow(image_cargo(:,:,2));
subplot(2, 2, 4);
imshow(image_cargo(:,:,3));