function [frequencies, db] = my_fft(signal, fs)

% size of discrete signal
n = length(signal);

% number of fourier coefficients for the fft
NFFT = 2^nextpow2(n);

% apply the fft to the signal 
Y = fft(signal,NFFT)/n;

% appropriately scale the frequencies given the signal's sampling frequency
frequencies = fs/2*linspace(0,1,NFFT/2+1);

% determine the |Y(f)| in the frequency space
db = 2*abs(Y(1:NFFT/2+1));

end