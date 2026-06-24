md
 Filter Design and System

Project Overview

This project demonstrates the design and analysis of Butterworth Low-Pass and High-Pass filters using MATLAB. The filters are designed with a cutoff frequency of 150 Hz and are evaluated in both the time and frequency domains. The system verifies filter performance by applying the filters to a test signal containing low-frequency, high-frequency, and noise components.

Objectives

- Design Butterworth Low-Pass Filter (LPF)
- Design Butterworth High-Pass Filter (HPF)
- Analyze magnitude and phase responses
- Apply filters to a sample signal
- Compare original and filtered signals in the time domain
- Verify filter performance in the frequency domain

Filter Specifications

| Parameter | Value |
|------------|--------|
| Sampling Frequency (Fs) | 1000 Hz |
| Nyquist Frequency (Fn) | 500 Hz |
| Cutoff Frequency (Fc) | 150 Hz |
| Filter Order | 4 |
| Filter Type | Butterworth |

---

Methodology

Step 1: Filter Specification

The sampling frequency, cutoff frequency, and filter order are defined. The cutoff frequency is normalized with respect to the Nyquist frequency.

Step 2: Filter Design

Two Butterworth filters are designed using MATLAB's `butter()` function:

- Low-Pass Filter (LPF)
- High-Pass Filter (HPF)

 Step 3: Frequency Response Analysis

The frequency response of both filters is obtained using the `freqz()` function. Magnitude and phase responses are plotted to observe filter characteristics.

Step 4: Signal Testing

A test signal is generated consisting of:

- 50 Hz sinusoidal component
- 300 Hz sinusoidal component
- Random noise

The signal is passed through both filters to evaluate their performance.

Step 5: Frequency Domain Verification

Fast Fourier Transform (FFT) is used to analyze the frequency spectrum of:

- Original signal
- LPF output
- HPF output

This verifies that the LPF preserves low-frequency components while the HPF preserves high-frequency components.

---

Results

Low-Pass Filter

- Passes frequencies below 150 Hz
- Retains the 50 Hz component
- Attenuates the 300 Hz component

 High-Pass Filter

- Passes frequencies above 150 Hz
- Retains the 300 Hz component
- Attenuates the 50 Hz component

Frequency Response

The magnitude and phase plots confirm the expected behavior of Butterworth filters with smooth roll-off characteristics.

---

 Tools and Technologies

- MATLAB
- Signal Processing Toolbox
- Butterworth Filter Design
- FFT Analysis

---

Output Figures

1. Frequency Response Analysis
   - LPF Magnitude Response
   - HPF Magnitude Response
   - LPF Phase Response
   - HPF Phase Response

2. Time Domain Analysis
   - Original Signal
   - LPF Output
   - HPF Output

3. Frequency Domain Analysis
   - Original Signal Spectrum
   - LPF Output Spectrum
   - HPF Output Spectrum

---

Conclusion

The project successfully implements a Butterworth Filter Design and System using MATLAB. The designed Low-Pass and High-Pass filters effectively separate low-frequency and high-frequency components of a signal. Time-domain and frequency-domain analyses confirm the accuracy and efficiency of the filter design.
```
