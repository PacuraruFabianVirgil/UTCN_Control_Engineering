Kf = 2;
Tf = 5;
deltastar = 0.1;
tsstar = 5.7;
cvstar = 1.5;
Hf = tf(Kf,[Tf 1 0]);
pcoverzc = 1.03;
deltathetac = pcoverzc-1;
delta2 = deltastar - deltathetac
epsilon = abs(log(delta2))/sqrt(pi^2+(log(delta2))^2)
wn = 4/epsilon/tsstar
deltawb = wn*sqrt(1-2*epsilon^2+sqrt(2-4*epsilon^2+4*epsilon^4))
cv2 = wn/2/epsilon
pc = deltathetac/(2*epsilon/wn-1/cvstar)
zc = pc/(1+deltathetac)
Hoc = tf(wn^2,[1 2*epsilon*wn wn^2])*tf([1 zc],[1 pc])*1.03;
Hoc
figure; step(Hoc)
ts = 6.71
overshoot = 9.81%
Hc = minreal(1/Hf*Hoc/(1-Hoc))
[num, den] = tfdata(Hc)
rNum = roots(num{1})
rDen = roots(den{1})
fprintf('        (%.2f s + 1)(%.2f s + 1)\n',1/-rNum(1),1/-rNum(2));
fprintf('Hc(s) = -------------------------\n');
fprintf('        (%.2f s + 1)(%.2f s + 1)\n\n',1/-rDen(1),1/-rDen(2));
fprintf('we use (T1s+1)(T2s+1) = (T1+T2)s+1 if T1>>T2\n\n')
fprintf('        (%.2f s + 1)(%.2f s + 1)\n',1/-rNum(1),1/-rNum(2));
fprintf('Hc(s) = -------------------------\n');
fprintf('               (%.2f s + 1)\n',1/-rDen(1)+1/-rDen(2));
Hc = tf([1/-rNum(1) 1],1)*tf([1/-rNum(2) 1],1)*tf(1,[1/-rDen(1)+1/-rDen(2) 1])
t = linspace(0,30);
figure; lsim(Hoc,t,t)
figure; bode(Hoc)
