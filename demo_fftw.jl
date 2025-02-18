using FFTW

# Create a sample signal: a sine wave with frequency 5
n = 1024
t = LinRange(0, 2π, n)
signal = sin.(5 * t)

# Compute the FFT of the signal
fft_signal = fft(signal)

println("First 10 elements of the FFT result:")
println(fft_signal[1:10])
