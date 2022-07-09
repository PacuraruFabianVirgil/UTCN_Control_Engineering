K = 3.5;
T = 0.5;
Hf = tf(K,[T 1 0]);
wco = 1/T;
wt = 2.3;
sigmastar = 10/100;
sigma = sigmastar;
tsstar = 1;
cvstar = 6;
deltaWbstar = 15;
zeta = abs(log(sigma))/sqrt(pi^2+log(sigma)^2);
A = 1/4/sqrt(2)/zeta^2;
F = 1.85;
N = 20*log10(A);
Vr = 10^((N-F)/20);
Hp = Vr*Hf;
ts = 3.5;
Td = T;
Tn = Td*tsstar/ts;
wc1 = 1.22;
wc2 = wc1*ts/tsstar;
Vrd = wc2/wc1;
Hpd = Hp*Vrd*tf([Td 1],[Tn 1]);
cv = 10^(14/20);
wz = 0.1*wt;
wp = cv/cvstar*wz;
Vrpi = cvstar/cv;
Tz = 1/wz;
Tp = 1/wp;
Hpid = Vrpi*tf([Tz 1],[Tp 1])*Hpd;
cv = 10^(15.5/20);
hold on
bodemag(Hf)
bodemag(Hp)
bodemag(Hpd)
bodemag(Hpid)
hold off
legend('Hf','Hp','Hpd','Hpid')
figure; step(feedback(Hpid,1))