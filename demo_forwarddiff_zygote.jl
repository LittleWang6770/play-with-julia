using ForwardDiff, Zygote

# Define a simple function
f(x) = sin(x) + x^2

# Compute derivative at x = 1.0 using ForwardDiff (forward-mode AD)
df_forward = ForwardDiff.derivative(f, 1.0)

# Compute derivative at x = 1.0 using Zygote (reverse-mode AD)
df_reverse, = Zygote.gradient(f, 1.0)  # Zygote returns a tuple; unpack it with a comma

println("ForwardDiff derivative at x = 1.0: ", df_forward)
println("Zygote derivative at x = 1.0: ", df_reverse)
