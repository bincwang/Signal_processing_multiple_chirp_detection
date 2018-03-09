%The input file here should be after we xcorr(chirp with chirp + noise)
fs = 44100;
t1=0: 1/fs: 0.01;
A = 10;
b = 57;
s_t1 = t1.^10/4;
ip1 = A*cos(b*t1 + s_t1);     %x is the chirp we generate *** important 
%we only have it for 0.1 s.
samples = [44100*5, 44100*30]; 
[song,Fs] = audioread('videoplayback.wav',samples);
%pulled 20s of the samples from the song 
%before fusion up, I need to pull Mix.wav out and combine with the noise.
new_samples = [44100*5, 44100*30];
[two_chirps, Fs2] = audioread('Mix.wav',new_samples);
ip2 = song + two_chirps;
%ip1 is chirp___silence 30 seconds total
%ip2 is noise + chirp in total 30 seconds
frame_duration = 0.01;
frame_len = frame_duration*fs;
N = length(ip2);
num_frames = floor(N/frame_len);
count = 0;
max_val = 0;
t = 0;
for i = 1 : num_frames
    %extract a frame of speech
    frame = xcorr(ip2( (i-1)*frame_len + 1 : frame_len*i), ip1); 
    if (1200 < max(frame))
        count1 = count1 + 1
        max_val = max(frame)
       
    end
end


clear all


    %I do it twice since it might have multiple chirps inside.

