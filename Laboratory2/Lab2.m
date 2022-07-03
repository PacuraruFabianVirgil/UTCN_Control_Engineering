Hf = tf(1,[2 1]);
Hr1 = tf(2,1);
Hr2 = tf(2,[1 0]);
Hr3 = tf(10,[1 0]);
Hr4 = tf(2,[1 0 0]);
Ho1 = Hr1*Hf/(1+Hr1*Hf); Ho1 = minreal(Ho1);
Ho2 = Hr2*Hf/(1+Hr2*Hf); Ho2 = minreal(Ho2);
Ho3 = Hr3*Hf/(1+Hr3*Hf); Ho3 = minreal(Ho3);
Ho4 = Hr4*Hf/(1+Hr4*Hf); Ho4 = minreal(Ho4);
subplot(2,2,1); step(Ho1);
subplot(2,2,2); step(Ho2);
subplot(2,2,3); step(Ho3);
subplot(2,2,4); step(Ho4);
figure; bode(Hr1*Hf);
figure; bode(Hr2*Hf);
figure; bode(Hr3*Hf);
figure; bode(Hr4*Hf);
% a)
T1 = 1/1.5;
ts1 = 4*T1;
cp1 = exp(6/20);
% b)
w2 = 1;
zeta2 = 0.5/2/w2;
sigma2 = exp(-pi*zeta2/sqrt(1-zeta2^2));
ts2 = 4/zeta2/w2;
cv2 = exp(6/20);
% c)
w3 = sqrt(5);
zeta3 = 0.5/2/w3;
sigma3 = exp(-pi*zeta3/sqrt(1-zeta3^2));
ts3 = 4/zeta3/w3;
cv3 = exp(20/20);