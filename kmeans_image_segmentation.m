%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Narmada Balasooriya
% k-means image segmentation implementation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Read the images
image_t = imread('cameraman.tif');
image_clr = imread('onion.png');

%% Convert the images to double %%
image_t = im2double(image_t);
image_clr = im2double(image_clr);

%% show the original images %%
figure;
subplot(2,1,1),imshow(image_t),title('grayscale image - cameraman.tif');
subplot(2,1,2),imshow(image_clr), title('color image - onion.png');

%% Get the image rows and columns %%
nrows_gray = size(image_t, 1);
ncols_gray = size(image_t, 2);
n_gray = size(image_t, 3);

nrows_clr = size(image_clr, 1);
ncols_clr = size(image_clr, 2);
n_clr = size(image_clr, 3);

%% Calculate the k-means for the grayscale image %%
figure;

[idx,C] = kmeans_modified(image_t(:),2);
pixel_test = reshape(idx, nrows_gray, ncols_gray, n_gray);
subplot(2,1,1),imshow(pixel_test, []), title('My k-means for grayscale image');

[idx_real, Cen_real] = kmeans(image_t(:),2);
pixel_labels = reshape(idx_real, nrows_gray, ncols_gray);
subplot(2,1,2),imshow(pixel_labels, []), title('Matlab k-means for grayscale image');

%% Get the color spaces of the image %%
r = image_clr(:,:,1);
g = image_clr(:,:,2);
b = image_clr(:,:,3);

R = r(:);
G = g(:);
B = b(:);
X = [R G B];

clrs = [1,0,0;
        1,0.4,0.1;
        1,0.5,0.9;
        1,1,0.1;
        0.8,0.8,0.40;
        0.7,0.3,0.2;
        0.6,0.1,0.9;
        0.4,0.7,0;
        0.4,0,1;
        0.1,0,0];

%% Calculate the k-means for the color image %%
figure;

[idx,C] = kmeans_modified(X,5);
pixel_test = ind2rgb(reshape(idx, size(image_clr,1), size(image_clr, 2)), clrs);
subplot(2,1,1),imshow(pixel_test, []), title('My k-means for color image');

[idx_real, Cen_real] = kmeans(X,5);
pixl = ind2rgb(reshape(idx_real, size(image_clr,1), size(image_clr, 2)), clrs);
subplot(2,1,2),imshow(pixl), title('Matlab k-means for color image');

%% k-means segmentation using matlab colormaps
figure;

clr_colormap = colorcube;
[idx,C] = kmeans_modified(X,5);
pixel_test = ind2rgb(reshape(idx, size(image_clr,1), size(image_clr, 2)), clr_colormap);
subplot(2,1,1),imshow(pixel_test, []), title('My k-means for color image - using colormaps');

[idx_real, Cen_real] = kmeans(X,5);
pixl = ind2rgb(reshape(idx_real, size(image_clr,1), size(image_clr, 2)), clr_colormap);
subplot(2,1,2),imshow(pixl), title('Matlab k-means for color image - using colormaps');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%