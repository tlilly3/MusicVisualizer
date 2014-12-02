tic;
[data, Fs] = audioread('monster.wav');
toc;
h = audioplayer(data(:,1),Fs);
%sec = length(freq)/Fs*10;
play(h);
tic;
s = 0:44100/10:length(data);
for i = 1:length(s)-1
[freq,db]=my_fft(data(s(i)+1:s(i+1),1),Fs);
plot(freq,db)
axis([0 15000 0 0.15])
pause(0.089)
end
toc;
stop(h);