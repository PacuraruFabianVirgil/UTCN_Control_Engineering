%% a)
Kf = 2;
Tf = 2;
ts = 35;
Hf = tf(Kf,[Tf 1 0]);
zeta = abs(log(15/100))/sqrt(pi^2+log(15/100)^2);
wn = 4/ts/zeta;
cv = wn/2/zeta;
deltaWb = wn*sqrt(1-2*zeta^2+sqrt(2-4*zeta^2+4*zeta^4));
Ho2 = tf(wn^2,[1 2*zeta*wn wn^2]);
Hc = 1/Hf*Ho2/(1-Ho2);
Ho = Hc*Hf/(1+Hc*Hf);
Ho = minreal(Ho);
figure;
step(Ho2);
t = linspace(0,30);
figure;
lsim(Ho2,t,t)
figure;
bode(Ho2)

%% b)
Kf = 2;
Tf = 2;
ts = 7;
Hf = tf(Kf,[Tf 1 0]);
zeta = abs(log(15/100))/sqrt(pi^2+log(15/100)^2);
wn = 4/ts/zeta;
cv = wn/2/zeta;
deltaWb = wn*sqrt(1-2*zeta^2+sqrt(2-4*zeta^2+4*zeta^4));
Ho2 = tf(wn^2,[1 2*zeta*wn wn^2]);
Hc = 1/Hf*Ho2/(1-Ho2);
Ho = Hc*Hf/(1+Hc*Hf);
Ho = minreal(Ho);
figure;
step(Ho2);
t = linspace(0,30);
figure;
lsim(Ho2,t,t)
figure;
bode(Ho2)

%% c)
Kf = 2;
Tf = 2;
ts = 3.8;
Hf = tf(Kf,[Tf 1 0]);
zeta = abs(log(10/100))/sqrt(pi^2+log(10/100)^2);
wn = 4/ts/zeta;
cv = wn/2/zeta;
deltaWb = wn*sqrt(1-2*zeta^2+sqrt(2-4*zeta^2+4*zeta^4));
Ho2 = tf(wn^2,[1 2*zeta*wn wn^2]);
Hc = 1/Hf*Ho2/(1-Ho2);
Ho = Hc*Hf/(1+Hc*Hf);
Ho = minreal(Ho);
figure;
step(Ho2);
t = linspace(0,30);
figure;
lsim(Ho2,t,t)
figure;
bode(Ho2)