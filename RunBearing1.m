fs=100000;
Ts=1/fs;
sim('bnew')
x=vel.signals.values;
t=Time.signals.values;
figure(1)
plot(t,x);
xlabel(' Time[s] ');
ylabel(' Amplitude ');
title(' Vibration Wafeform ');
L=length(x);
timevec=(0:Ts:Ts*(L-1));
XT=timeseries(x',timevec');
XT_fil=idealfilter(XT,[1000,2000],'pass'); %filtering in the band 1000-2000 Hz
yf=get(XT_fil,'data');
yf=squeeze(yf);
yh=abs(hilbert(yf));
y=abs(fft(yh))/length(yh);
fy=(0:fs/length(y):(length(y)-1)*fs/length(y))';
figure(2)
%plot(fy(2:round(length(y)/2),1),y(2:round(length(y)/2),1));
plot(fy(2:100,1),y(2:100,1));
xlabel(' Frequency [Hz] ');
ylabel(' Amplitude ');
title(' Vibration Spectrum ');