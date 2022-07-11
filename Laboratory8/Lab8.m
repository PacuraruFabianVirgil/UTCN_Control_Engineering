Hf = [tf(2,[1 1]) tf(2,[1 1 0]) tf(2,[10 11 1]) tf(2,[10 11 1 0]) tf(2,[200 230 31 1]) tf(2,[200 230 31 1 0])];
Hd1 = [tf(1,1) tf(1,1) tf(1,1) tf(1,1) tf(1,1) tf(1,1)];
Hd2 = [tf(1,1) tf(1,1) tf(1,1) tf(1,1) tf(1,1) tf(1,1)];
for i = 1:length(Hf)
    Tsigma = 1;
    Hmag = tf(1,[2*Tsigma^2 2*Tsigma 0]);
    Hsym = tf([4*Tsigma 1],[8*Tsigma^3 8*Tsigma^2 0 0]);
    Hd1(i) = minreal(Hmag/Hf(i));
    Hd2(i) = minreal(Hsym/Hf(i));
    figure;
    hold on;
    step(feedback(Hd1(i)*Hf(i),1));
    step(feedback(Hd2(i)*Hf(i),1));
    hold off;
end