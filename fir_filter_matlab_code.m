% File: FIR_Filters_in_Matlab.m
% Description: Two-Dimensional Finite Impulse Response (FIR) Filters in Matlab
% Environment: Matlab

close all;
%Low pass filter
original_1 = imread('m83.tif');
B = imbinarize(original_1, 0.4);
figure(1);
subplot(1,2,1), imshow(original_1), title('Original image');
subplot(1,2,2), imshow(B), title('Binary image');
Filter = fspecial('average', [3 3]);
New_image = imfilter(B,Filter,'symmetric');
figure(2);
subplot(1,2,1), imshow(B), title('Binary image');
subplot(1,2,2), imshow(New_image), title('Average, symmetric, 3x3 image');

%High pass filter
original_2 = imread('liftingbody.png');
E1 = edge(original_2,'prewitt');
E2 = edge(original_2,'roberts');
E3 = edge(original_2,'log');
figure(3);
subplot(2,2,1), imshow(original_2), title('Original image');
subplot(2,2,2), imshow(E1), title('Prewitt edge detection');
subplot(2,2,3), imshow(E2), title('Roberts edge detection');
subplot(2,2,4), imshow(E3), title('Log edge detection');

%Image sharpness
unsharp_image = imread('westconcordorthophoto.png');
sharp_image = imsharpen(unsharp_image, 'Radius', 2, 'Amount', 1);
figure(4);
subplot(1,2,1), imshow(unsharp_image), title('Unsharp image');
subplot(1,2,2), imshow(sharp_image), title('Sharp image');


%Fourier transform
[original_3, colormap] = imread('saturn.png');
Gray_scale = rgb2gray(original_3);
figure(5);
subplot(1,2,1), imshow(original_3), title('Original image');
subplot(1,2,2), imshow(Gray_scale), title('Gray scale image');

Image_fft2 = fft2(Gray_scale);
Image_fftshift = fftshift(Image_fft2);

figure(6);
subplot(1,2,1), imshow(log(abs(Image_fftshift)),[]), title('fft2 filter');
Image_fftshift(abs(Image_fftshift) < 1000) = 0;
subplot(1,2,2), imshow(log(abs(Image_fftshift)) + eps,[]), title('Removing the noise');



% EMBOSS FILTER
emboss_original = imread('cameraman.tif');
emboss_kernel = [-2  -1   0;
                 -1   1   1;
                  0   1   2];
image_double = double(emboss_original);
embossed = conv2(image_double, emboss_kernel, 'same');
% After convolution values go negative (shadows) and
% very high (highlights) so we shift by +128
% to center everything around mid-gray
embossed_shifted = embossed + 128;
% Clip values to valid display range 0-255
embossed_clipped = max(0, min(255, embossed_shifted));
% Convert back to uint8 for display
embossed_final = uint8(embossed_clipped);
figure(7);
subplot(1,2,1), imshow(emboss_original), title('Original image');
subplot(1,2,2), imshow(embossed_final),  title('Embossed image');
% Light coming from North (top)
kernel_north = [ 0  -1   0;
                 0   1   0;
                 0   1   0];

% Light coming from South (bottom)
kernel_south = [ 0   1   0;
                 0   1   0;
                 0  -1   0];

% Light coming from East (right)
kernel_east  = [ 0   0   0;
                -1   1   1;
                 0   0   0];

% Apply all three direction kernels
emboss_N = uint8(max(0, min(255, conv2(image_double, kernel_north, 'same') + 128)));
emboss_S = uint8(max(0, min(255, conv2(image_double, kernel_south, 'same') + 128)));
emboss_E = uint8(max(0, min(255, conv2(image_double, kernel_east,  'same') + 128)));

figure(8);
subplot(2,2,1), imshow(emboss_original), title('Original image');
subplot(2,2,2), imshow(emboss_N),        title('Emboss - Light from North');
subplot(2,2,3), imshow(emboss_S),        title('Emboss - Light from South');
subplot(2,2,4), imshow(emboss_E),        title('Emboss - Light from East');