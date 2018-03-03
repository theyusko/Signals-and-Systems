clear all;
close all;
%%CALCULATE FREQUENCY RESPONSE%%
M = [11 31 61];
[~,col] = size(M);
nfreqs = 100; % Let Nyquist frequency be 100
w=-pi:2*pi/nfreqs:pi; %I have 100 different values of -pi<w<pi
freqResp1 = zeros(1,size(w,2));
freqResp2 = zeros(1,size(w,2));
freqResp3 = zeros(1,size(w,2));
 
for a = 1:col % for each M-moving averager
    h = ones(M(a),1)/M(a); %impulse response 
    for k = 1:M(a)
        m = (k-1)-((M(a)-1)/2);
        if a == 1 
                freqResp1 = freqResp1 + (1/M(a))*exp((-1i)*w*m);
            else if a == 2
                freqResp2 = freqResp2 + h(k)*exp((-1i)*w*m);
                else
                    freqResp3 = freqResp3 + h(k)*exp((-1i)*w*m);
                end
        end
        %1i for imaginary unit
    end
    %%DISPLAY FREQUENCY RESPONSE%% 
    figure(a)
    if a == 1 
        plot(w,abs(freqResp1))
            else if a == 2
                plot(w,abs(freqResp2))
                else
                    plot(w,abs(freqResp3))
                end
    end
        axis tight;
        title( [ 'Frequency Response when M=' num2str(M(a)) ] );
        xlabel('w:radian frequency'); ylabel('H:Frequency Response'); 
        grid on; hold on;
    
end
