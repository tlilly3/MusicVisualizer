% Simple Fourier Decomposition of Benign and Pathologic PCG Signals
% Author: Mohamad Ali Najia
% Last Modified: 31 October 2013


clear; close all; clc;

%% Characterize Benign PCG signal

% Import sound file and initialize variables
[benign,fs,nbit] = wavread('pcg_normal.wav');   %outputs sound data, sampling frequency, and number of bits per sample in xNorm, fs, and nbit, respectively. 
%sound(x,fs)
n = length(benign);
t = linspace(1,n/fs,n);  %time vector (in seconds) of signal
range = 2000;

% Time Domain
subplot(2,2,1)
plot(t(10000:33000), benign(10000:33000))
title('Normal PCG Signal')
xlabel('Time (sec)')
ylabel('Amplitude')

% Frequency Domain
subplot(2,2,3)
[frequencies,db] = my_fft(benign,fs);
plot(frequencies(1:range),db(1:range))
title('Fourier Transform of Normal PCG Signal')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')


%% Characterize Pathologic PCG Signal

% Import sound file and initialize variables
[pathologic,fs,nbit] = wavread('pcg22.wav');
n = length(pathologic);
t = linspace(1,n/fs,n);

% Time Domain
subplot(2,2,2)
plot(t(1:11000),pathologic(1:11000))
title('Pathological PCG Signal')
xlabel('Time (sec)')
ylabel('Amplitude')

% Frequency Domain
subplot(2,2,4)
[frequencies,db] = my_fft(pathologic,fs);
plot(frequencies(1:range-900),db(1:range-900)) 
title('Fourier Transform of Pathological PCG Signal')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

