
% Demo for convergence of iterative first-order reverse image filtering
%
% By Li Dong, yb47452@umac.mo
% Department of Computer and Information Science, University of Macau
%
% The code and the algorithm are for non-comercial use only.


close all; clear;

% ======= function =======
% % gaussian filtering (GS) 
H       = fspecial('gaussian', [7 7], 2);

% % rotationally symmetric Laplacian of Gaussian filter (LOG)
% H       = fspecial('log', [5 5], 0.5);

% % guided filtering (GF)
% f = @(x) imguidedfilter(x);

% % Unsharp Masking Filter (UMF) 
% f = @(x) imsharpen(x);

% % linear motion blurring (MT)
% H = fspecial('motion',10,45);

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


fstr = 'BSD500/'; 
Files = dir(strcat(fstr,'*.jpg'));
LengthFiles = length(Files);



N =20;
OurData = zeros(LengthFiles,N+1); % the first coloum is the intial PSNR

for fi = 1:LengthFiles
    disp([num2str(fi), ' : ' Files(fi).name]);
    original_image = imread(strcat(fstr,Files(fi).name));
    if ~ismatrix(original_image)
        original_image = rgb2gray(original_image);
    end

    X = im2double(original_image);
    ps = size(X);
    
    % filtered image
    y = f(X);
    
    Xpre = y;
    Xcur = y;
        
    OurData(fi,1) = psnr(X,y);
    for i = 1:N
        
        Xpre = Xcur;
        Xfcur =  f(Xcur);
        
        % first-order reverse image filtering
        Xcur = ifft2( (fft2(y).*fft2(Xcur))./(fft2(Xfcur)+eps)); 
        OurData(fi,i+1) = psnr(X,Xcur);
        
    end
    
end

% plot PSNR v.s. iteration curve
OurMean = mean(OurData,1);
figure;plot(1:N+1,OurMean,'-r');
grid on;


