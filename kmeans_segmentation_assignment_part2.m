%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Narmada Balasooriya
% k-means image segmentation implementation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Read the images
image_1 = imread('Disease8.jpg');
image_2 = imread('Disease11.jpg');
image_3 = imread('Disease12.jpg');

%% Convert the images to double %%
image_1 = im2double(image_1);
image_2 = im2double(image_2);
image_3 = im2double(image_3);

%% show the original images %%
figure;
subplot(2,2,1), imshow(image_1), title('Disease8');
subplot(2,2,2), imshow(image_2), title('Disease11');
subplot(2,2,3), imshow(image_3), title('Disease12');


%% Get the image rows and columns %%
nrows_1 = size(image_1, 1);
ncols_1 = size(image_1, 2);
clr_1 = size(image_1, 3);

nrows_2 = size(image_2, 1);
ncols_2 = size(image_2, 2);
clr_2 = size(image_2, 3);

%% Get the color spaces of the image %%

% image_1
r1 = image_1(:,:,1);
g1 = image_1(:,:,2);
b1 = image_1(:,:,3);

R1 = r1(:);
G1 = g1(:);
B1 = b1(:);
X1 = [R1 G1 B1]; % final image_1

% image_2
r2 = image_2(:,:,1);
g2 = image_2(:,:,2);
b2 = image_2(:,:,3);

R2 = r2(:);
G2 = g2(:);
B2 = b2(:);
X2 = [R2 G2 B2]; % final image_2

% image_3
r3 = image_3(:,:,1);
g3 = image_3(:,:,2);
b3 = image_3(:,:,3);

R3 = r3(:);
G3 = g3(:);
B3 = b3(:);
X3 = [R3 G3 B3]; % final image_3

% Set the color space
clrs = [1,0,0;
        0.4,0.7,0;
        0.1,0,0;
        1,0.5,0.9;
        1,1,0.1;
        0.8,0.8,0.40;
        0.7,0.3,0.2;
        0.6,0.1,0.9;
        0.4,0,1;
        1,0.4,0.1
        ];

%% Calculate the k-means for the color image %%
figure;

[idx,C] = kmeans_modified(X1,4);
pixel_test = ind2rgb(reshape(idx, size(image_1,1), size(image_1, 2)), clrs);
subplot(2,2,1),imshow(pixel_test, []), title('My k-means - Disease8');

[idx,C] = kmeans_modified(X2,4);
pixel_test = ind2rgb(reshape(idx, size(image_2,1), size(image_2, 2)), clrs);
subplot(2,2,2),imshow(pixel_test, []), title('My k-means - Disease11');

[idx,C] = kmeans_modified(X3,4);
pixel_test = ind2rgb(reshape(idx, size(image_3,1), size(image_3, 2)), clrs);
subplot(2,2,3),imshow(pixel_test, []), title('My k-means - Disease12');

%%
