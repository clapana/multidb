%Programma che legge file audio, lo analizza
clf;
[x fs nbits] = wavread("oboe_test-short.wav");
%[x fs nbits] = wavread("piano-phrase.wav");

sinc = 1/fs;
dur = sinc*size(x, 1);
t = [0:sinc:dur-sinc];
y = onset4(x);


%plot(t(fs:fs*10), y(fs:fs*10))
plot(t(1:fs*10), x(1:fs*10), t(1:fs*10), y(1:fs*10))
%axis([2.82 2.9])

%y = stft(x, )