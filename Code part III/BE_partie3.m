%Question 18
I=imread('toulouse.bmp');

T=3;
alpha=1/(2*T+1)^2;
h = ones(2*T+1,2*T+1);
h= alpha* h;
for n=T+1:2*T+1
    for p=T+1:2*T+1
        h(n,p)=0;
    end
end

Ifiltered = imfilter(I, h, 'replicate');
 
Ibruit = double(Ifiltered)/255;
Ifftbruit = fftshift(fft2(Ibruit));

I_uint8 = imread('toulouse.bmp'); 
Id = double(I_uint8)/255;
Ifft = fftshift(fft2(Id));

figure(1)
subplot 121
imagesc(log(abs(Ifft)))
colormap(gray)
title('original image (module, log scale)')
colorbar
subplot 122
imagesc(log(abs(Ifftbruit)))
colormap(gray)  
title('blurred image (module, log scale)')
colorbar

%%Question 21
I2=imread('marcheur.jpg');
Ib = double(I2)/255;

RestW = deconvwnr(Ib,h);
figure(2)
imshow(RestW)