
% Demo for iterative first-order reverse image filtering
%
% By Li Dong, yb47452@umac.mo
% Department of Computer and Information Science, University of Macau
%
% The code and the algorithm are for non-comercial use only.


close all; clear;

% ======= function =======
% % gaussian filtering (GS) 
% H       = fspecial('gaussian', [7 7], 2);

% % rotationally symmetric Laplacian of Gaussian filter (LOG)
% H       = fspecial('log', [5 5], 0.5);

% % guided filtering (GF)
% f = @(x) imguidedfilter(x);

% % Unsharp Masking Filter (UMF) 
% f = @(x) imsharpen(x);

% % linear motion blurring (MT)
H = fspecial('motion',10,45);

% %  disk filtering (DK)
% H = fspecial('disk',5);

% %  ===== image filtering =====
f = @(x) imfilter(x,H,'circular'); 

% %  median filtering (MF)
% f = @(x) medfilt2(x);

% %  adatpive wiener filtering (AWF)
% f = @(x) wiener2(x, [5 5], (10/255)^2);

% % L0 smoothing (L0)
% f = @(x)  L0Smoothing(x, 0.001);

% % bilateral filtering (BF)
% f = @(x) bilateralFilter(x,[]);



RGB = imread('oldman.jpg');

R = im2double(RGB(:,:,1));
G = im2double(RGB(:,:,2));
B = im2double(RGB(:,:,3));



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

% filtered image
filteredRGB = cat(3,Ry,Gy,By);
figure;imshow(filteredRGB,[]);
title('Filtered Image');

% restored image
deRGB = cat(3,Xcur_R,Xcur_G,Xcur_B);
figure;imshow(deRGB,[]);
title('Restored Image');
    
    



