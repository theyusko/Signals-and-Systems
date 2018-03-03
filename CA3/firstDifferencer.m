clear all;
close all;
%%APPLY DIFFERENCE FIlTER TO IMAGE%%
A=imread('couple.bmp');
J=mat2gray(A, [0 255]);
[row,col] = size(J);

diffImage = J;
for n = 1:row
    for m= 1:col
        if(n>1)
            diffImage(n,m) = diffImage(n,m) - J(n-1,m);
        end
    end
end
figure;
imshow(diffImage);
title('Differencer Filtered Image');
hold on;

%%DISPLAY%%
nfreqs = 100;
w=-pi:2*pi/nfreqs:pi;
freqResp = 1 - exp(-1j*w);

figure;
plot(w,abs(freqResp));
axis tight;
title( 'Frequency Response of Differencer' );
xlabel('w:radian frequency'); ylabel('H:Frequency Response'); 
grid on;

