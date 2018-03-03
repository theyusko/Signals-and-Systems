%i%
w0 = input('w0 (radian frequency) = ');
A1 = input('A1 (amplitude) =');
A2 = input('A2 =');
A3 = input('A3 =');
Phi1Degrees = input('phase shift1 (in degrees)  = ') ;
Phi2Degrees = input('phase shift2 (in degrees)  = ');
Phi3Degrees = input('phase shift3 (in degrees)  = ');
%Convert the numbers into radians
Phi1 = Phi1Degrees*pi/180;
Phi2 = Phi2Degrees*pi/180;
Phi3 = Phi3Degrees*pi/180;

%ii%
x1 = A1*exp(j*Phi1);
x2 = A2*exp(j*Phi2);
x3 = A3*exp(j*Phi3);
x = x1 + x2 + x3;
A = abs(x)
%angle(x) gives phi in radians
phi = (angle(x))*180/pi

%iii%
phi2=round(angle(x)*100)/100; %2 decimal point precision
if phi2 >= 0 
    funct = ['x(t) = ',num2str(A),'*cos(',num2str(w0),'t+',num2str(phi2),')'];
else 
    funct = ['x(t) = ',num2str(A),'*cos(',num2str(w0),'t',num2str(phi2),')'];
end
disp(funct);

%iv%
p1 = [0;x1];
p2 = [0;x2];
p3 = [0;x3];
p = [0; x];
figure;
plot(real(p1), imag(p1),'LineWidth', 2); hold on;
plot(real(p2), imag(p2),'LineWidth', 2); hold on;
plot(real(p3), imag(p3),'LineWidth', 2); hold on;
plot(real(p), imag(p),'LineWidth', 5); hold on;
xlim([-30 30]);
ylim([-30 30]);
xlabel('real axis');
ylabel('imaginary axis');
grid on;

%v%
v1 = [0;x1];
v2 = [x1;(x2+x1)];
v3 = [(x1+x2);x];
v= [0; x];
figure;
plot(real(v1), imag(v1),'LineWidth', 2); hold on;
plot(real(v2), imag(v2),'LineWidth', 2); hold on;
plot(real(v3), imag(v3),'LineWidth', 2); hold on;
plot(real(v), imag(v),'LineWidth', 5); hold on;
xlabel('real axis');
ylabel('imaginary axis');
grid on;