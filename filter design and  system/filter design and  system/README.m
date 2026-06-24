```matlab
clc;
clear;
close all;

%% Filter Specifications

Fs    = 1000;      % Sampling Frequency (Hz)
Fn    = Fs/2;      % Nyquist Frequency (Hz)
Fc    = 150;       % Cutoff Frequency (Hz)
Order = 4;         % Butterworth Filter Order

Wn = Fc/Fn;

fprintf('\nSampling Frequency : %d Hz\n', Fs);
fprintf('Cutoff Frequency   : %d Hz\n', Fc);
fprintf('Filter Order       : %d\n\n', Order);

%% Filter Design

[b_lpf, a_lpf] = butter(Order, Wn, 'low');
[b_hpf, a_hpf] = butter(Order, Wn, 'high');

disp('Butterworth filters designed successfully.');

%% Frequency Response Analysis

[H_lpf, f] = freqz(b_lpf, a_lpf, 1024, Fs);
[H_hpf, ~] = freqz(b_hpf, a_hpf, 1024, Fs);

figure('Name','Frequency Response Analysis');

subplot(2,2,1);
plot(f,20*log10(abs(H_lpf)),'LineWidth',2);
xline(Fc,'--');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Low-Pass Filter Magnitude Response');
xlim([0 Fn]);
grid on;

subplot(2,2,2);
plot(f,20*log10(abs(H_hpf)),'LineWidth',2);
xline(Fc,'--');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('High-Pass Filter Magnitude Response');
xlim([0 Fn]);
grid on;

subplot(2,2,3);
plot(f,unwrap(angle(H_lpf))*180/pi,'LineWidth',2);
xline(Fc,'--');
xlabel('Frequency (Hz)');
ylabel('Phase (Degrees)');
title('Low-Pass Filter Phase Response');
xlim([0 Fn]);
grid on;

subplot(2,2,4);
plot(f,unwrap(angle(H_hpf))*180/pi,'LineWidth',2);
xline(Fc,'--');
xlabel('Frequency (Hz)');
ylabel('Phase (Degrees)');
title('High-Pass Filter Phase Response');
xlim([0 Fn]);
grid on;

sgtitle('Butterworth Filter Frequency Response');

%% Test Signal Generation

t = 0:1/Fs:1-1/Fs;

x = sin(2*pi*50*t) + ...
    0.8*sin(2*pi*300*t) + ...
    0.3*randn(size(t));

%% Signal Filtering

y_lpf = filter(b_lpf,a_lpf,x);
y_hpf = filter(b_hpf,a_hpf,x);

%% Time Domain Analysis

figure('Name','Time Domain Analysis');

n = 400;

subplot(3,1,1);
plot(t(1:n),x(1:n));
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal');
grid on;

subplot(3,1,2);
plot(t(1:n),y_lpf(1:n),'LineWidth',1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Low-Pass Filter Output');
grid on;

subplot(3,1,3);
plot(t(1:n),y_hpf(1:n),'LineWidth',1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('High-Pass Filter Output');
grid on;

sgtitle('Time Domain Results');

%% Frequency Domain Analysis

N = length(x);
fq = (0:N/2)/N*Fs;

Xf   = 2*abs(fft(x)/N);
Ylpf = 2*abs(fft(y_lpf)/N);
Yhpf = 2*abs(fft(y_hpf)/N);

figure('Name','Frequency Domain Analysis');

subplot(3,1,1);
plot(fq,Xf(1:N/2+1),'LineWidth',1.5);
xline(Fc,'--');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Original Signal Spectrum');
xlim([0 Fn]);
grid on;

subplot(3,1,2);
plot(fq,Ylpf(1:N/2+1),'LineWidth',1.5);
xline(Fc,'--');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Low-Pass Filter Output Spectrum');
xlim([0 Fn]);
grid on;

subplot(3,1,3);
plot(fq,Yhpf(1:N/2+1),'LineWidth',1.5);
xline(Fc,'--');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('High-Pass Filter Output Spectrum');
xlim([0 Fn]);
grid on;

sgtitle('Frequency Domain Results');

disp('Program executed successfully.');
```
