%Programma che legge file audio, lo analizza

[x fs nbits] = wavread("oboe_test.wav");

sinc = 1/fs;
dur = sinc*size(x, 1);
t = [0:sinc:dur-sinc];
y = onset(x);
subplot(2, 1, 1)
plot(t(40000:60000), y(40000:60000))
subplot(2, 1, 2)
plot(t(40000:60000), x(40000:60000))

%y = stft(x, )