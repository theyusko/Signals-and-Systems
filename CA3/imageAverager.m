clear all;
close all;
%%AVERAGE OUT IMAGES%%
A = imread('couple.bmp');
J = mat2gray(A, [0 255]); 
[row,col] = size(J);
% J values range between 0(black) and 1(white) -- J is 512x512 matrix
avgImages = zeros(row,col); % an array for each averaging value of M

figure(1)
subplot(2,2,1), imshow(J) %show original image as well
%%1-D Averaging%%
M = [11 31 61];
for i = 1:3
    avgImages(:,:,i) = movingAverage(J,M(i));
    subplot(2,2,i+1), imshow(avgImages(:,:,i)) 
    %subplot(m,n,p), define an m-by-n matrix of display regions
    %and specify which region, p, is active
end

%%ADD NOISE%%
c = [0.2 1]; %c values 
noise(:,:,1)=(rand(row,col)-0.5)*c(1); % generate random noise
noise(:,:,2)=(rand(row,col)-0.5)*c(2); %no need to loop for a matrix of 1x2
avgImages_Noisy = zeros(row,col); %matrix of noisy images

for i = 1:3
    avgImages_Noisy(:,:,i,1) = movingAverage(J+noise(:,:,1),M(i));
    avgImages_Noisy(:,:,i,2) = movingAverage(J+noise(:,:,2),M(i));
    figure(2)
    subplot(2,3,i), imshow(avgImages_Noisy(:,:,i,1)); title(['M=' num2str(M(i))  ' filter with noise c=0.2'])
    subplot(2,3,i+3), imshow(avgImages_Noisy(:,:,i,2)); title(['M=' num2str(M(i))  ' filter with noise c=1'])
    hold on
end

function y = movingAverage(A, M) 
    %reference: http://matlabtricks.com/post-11/moving-average-by-convolution
    h = ones(1,M)/M; %use [1/M 1/M .... 1/M] kernel as the impulse response
    %so that the convolution will result in average
    y = conv2(A,h,'same');
end