% Demo for the non-blind image deblurring
%
% By Li Dong, yb47452@umac.mo
% Department of Computer and Information Science, University of Macau
%
% The code and the algorithm are for non-comercial use only.

close all; clear;

% RGB = imread('testimage2.bmp');
% H = double(rgb2gray(imread('testkernel2.bmp')));

RGB = imread('testimage1.bmp');
H = double(rgb2gray(imread('testkernel1.bmp')));

R = im2double(RGB(:,:,1));
G = im2double(RGB(:,:,2));
B = im2double(RGB(:,:,3));

% normalized kernel
H = H./sum(H(:));

% blurring filter
f = @(x) imfilter(x,H,'circular'); 


% filtered image
Ry = f(R);
Gy = f(G);
By = f(B);

% initialization
N =20;
Xcur_R = Ry;
Xcur_G = Gy;
Xcur_B = By;

for i = 1:N
    Xfcur_R =  f(Xcur_R);
    Xfcur_G =  f(Xcur_G);
    Xfcur_B =  f(Xcur_B);

    % first-order reverse filtering 
    Xcur_R = ifft2( (fft2(Ry).*fft2(Xcur_R))./(fft2(Xfcur_R)+eps)); 
    Xcur_G = ifft2( (fft2(Gy).*fft2(Xcur_G))./(fft2(Xfcur_G)+eps)); 
    Xcur_B = ifft2( (fft2(By).*fft2(Xcur_B))./(fft2(Xfcur_B)+eps)); 
end

% show images
% original image
figure;imshow(RGB,[]);
title('Original Image');

% blurred image
filteredRGB = cat(3,Ry,Gy,By);
figure;imshow(filteredRGB,[]);
title('Filtered Image');

% restored image
deRGB = cat(3,Xcur_R,Xcur_G,Xcur_B);
figure;imshow(deRGB,[]);
title('Restored Image');



