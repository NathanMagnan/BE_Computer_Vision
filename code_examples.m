%% 1- Introduction typage
clear all
close all 
clc

I = imread('cameraman.tif'); %Uint8

figure(1)
imshow(I)
title('cameraman, imshow')

figure(2)
imagesc(I)
title('imagesc')

figure(3)
imagesc(I*0.5)
title('imagesc I*0.5')

figure(4)
imshow(I/255)
title('imshow I/255')

figure(5)
imshow(double(I/255))
title('imshow double(I/255)')

figure(6)
imshow(double(I)/255)
title('imshow double(I)/255')

%% 2- Colours
clear all
close all 
clc

I = double(imread('cameraman.tif'))/255; 

figure(1)
imshow(I)
title('cameraman, imshow')

Ir = 0.*I; % or = zeros(size(I))
Ig = 0.*I;
Ib = 0.9*I;

Irgb = zeros([size(I), 3]);
Irgb(:,:,1) = Ir;
Irgb(:,:,2) = Ig;
Irgb(:,:,3) = Ib;

figure(2)
imshow(Irgb)
title('Irgb')

%% 3- Smooth
clear all
close all 
clc

I = uint8(repmat([[0:25:230]'; [0:25:230]'], 1,10));
Inoise = uint8(50*randn(size(I)));
Inoisy = I + Inoise;

figure(1)
subplot 131
imagesc(I)
title('I')
colormap gray
subplot 132
imagesc(Inoise)
title('noise')
colormap gray
subplot 133
imagesc(Inoisy)
title('Inoisy')
colormap gray


kernel_sizes = 1:10;

figure(2)
for k = 1:kernel_sizes(end)
   h = 1/k^2* ones(k);
   Ifiltered = imfilter(Inoisy, h, 'replicate');
   imagesc(Ifiltered)
   colormap gray
   title(['Kernel size is: ', num2str(k)]);
   drawnow()
   pause(0.3)
end

%% 4- Gradients
clear all
close all 
clc

I_uint8 = imread('cameraman.tif'); 
Id = double(I_uint8)/255;

figure(1)
imshow(Id)
title('cameraman')

H_vert = [1 1 1; 0 0 0; -1 -1 -1]
H_hor = H_vert'

Ig_v = imfilter(Id, H_vert);
Ig_h = imfilter(Id, H_hor);

Ig = sqrt(Ig_h.^2 + Ig_v.^2);

Ig_t = Ig>1.5;

figure(2)
imshow(Ig_h)
title('imshow Ig h')

figure(3)
imshow(abs(Ig_h))
title('imshow abs(Ig h)')

figure(4)
imagesc(Ig_h)
title('imagesc Ig h')

figure(5)
imshow(abs(Ig_v))
title('imshow abs(Ig v)')

figure(6)
imshow(Ig)
title('imshow Ig')

figure(7)
imshow(Ig_t)
title('imshow Ig seuillée à 1.5')

%% 4bis- Gradient: conv vs corr
clear all
close all 
clc

H_hor = [1 1 1; 0 0 0; -1 -1 -1]'

Iraie = ones(100);
Iraie(:,1:30) = 0;
Iraie(:,70:100) = 0;

figure(1), 
subplot 121
imagesc(Iraie)
colormap('gray')
title('Raies')
subplot 122
imagesc(H_hor)
colormap('gray')
title('Horizontal Kernel')

figure(2), 
imagesc(H_hor)
colormap('gray')
title('Horizontal Kernel')

Iraie_corr = imfilter(Iraie, H_hor);
figure(3), 
subplot 211
imagesc(Iraie)
colormap('gray')
title('Raies')
subplot 212
imagesc(Iraie_corr)
colormap('gray')
title('correlation')

Iraie_conv = imfilter(Iraie, H_hor, 'conv');

figure(4), 
subplot 211
imagesc(Iraie)
colormap('gray')
title('Raies')
subplot 212
imagesc(Iraie_conv)
colormap('gray')
title('convolution')

%% 5 Fourier intro
% clear all
% close all
% clc
N = 1000;
Tvec = [2:1:20, 30:10:50, 50:50:500, 500:100:N];
theta = 90;

for t = 1:length(Tvec)
    T = Tvec(t)
    I = repmat([1:N],N,1);
    I = cos(2*pi*I/T);
    I = imrotate(I, theta);

    figure(1),
    imshow(I)
    caxis([-1,1])
    title(['Image: frequence is ', num2str(N/T), ', angle is: ', num2str(theta), ' deg'])


    Ifft = fftshift(fft2(I));
    figure(2),
    imagesc(imfilter((abs(Ifft)), 1/121*ones(11)))
    colormap(gray)
    title(['Module of Fourier transform (with fftshift): frequence is ', num2str(N/T), ', angle is: ', num2str(theta), ' deg'])
    drawnow()
    pause(0.2)
end

%% 5- Fourier
clear all
close all 
clc

% Effect of fftshift()
Itest = [1:100]'*[1:100];
Itest(70:74,:) = 0;
figure(1)
subplot 121
imagesc(Itest)
title('Test image')
subplot 122
imagesc(fftshift(Itest))
title('fftshift effect')

% fft2() with 'real' image
I_uint8 = imread('cameraman.tif'); 
Id = double(I_uint8)/255;

Ifft = fftshift(fft2(Id));
Ifft_inv = ifft2(fftshift(Ifft));

figure(2)
subplot 121
imshow(abs(Ifft)/max(max(abs(Ifft))))
title('Ifft module')
subplot 122
imshow(angle(Ifft)/max(max(angle(Ifft))))
title('Ifft phase')

figure(3)
subplot 121
imagesc(abs(Ifft)/max(max(abs(Ifft))))
colormap(gray)  
title('Ifft module')
subplot 122
imagesc(log(abs(Ifft)))
colormap(gray)  
% imshow(log(abs(Ifft))/max(max(log(abs(Ifft))))) % is equivalent to the two previous lines
title('Ifft log module')

figure(4)
subplot 121
imshow(Id)
title('I')
subplot 122
imshow(Ifft_inv)
title('Ifft inv')

% fft2 of Hor et Vert grad
Id_hor = zeros(1023);
Id_ver = zeros(1023);

H_ver = [1 1 1; 0 0 0; -1 -1 -1]
H_hor = H_ver'

Id_hor(510:512,510:512) = H_hor;
Ifft_hor = fftshift(fft2(Id_hor));

Id_ver(510:512,510:512) = H_ver;
Ifft_ver = fftshift(fft2(Id_ver));

figure(5)
subplot 121
imagesc(abs(Ifft_hor)/max(max(abs(Ifft_hor))))
colormap(gray)  
title('Ifft horizontal filter')

subplot 122
imagesc(abs(Ifft_ver)/max(max(abs(Ifft_ver))))
colormap(gray)  
title('Ifft vertical filter')

