
clear all

fs=44100;
t1=0: 1/fs: 0.01;
A = 0.5;
b = 57;
s_t1 = t1.^10/4;
x = A*cos(b*t1 + s_t1);

count1 = 0


t0=0: 1/fs: 9.99;
Am = 0;
s_t0 = t0.^10/4;
y = Am*cos(b*t0 + s_t0);

t = 0: 1/fs: 0.01;
s_t = t.^10/4;
z = Am*cos(b*t + s_t);

%y = 0*sin(2*pi*466.16*t);
%soundsc(x,fs);
melody=[y x z z z x y z z z x x x x z x z z x z z x z x z x y y y];
filename = 'Mix.wav';

%melody =melody./max(abs(melody));
%This is used for reducing compile error
soundsc(melody,fs);
audiowrite(filename,melody,fs);