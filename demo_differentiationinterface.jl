using DifferentiationInterface, ForwardDiff

# A simple function
f(x) = sin(x) + x^2

# Depending on the version of DifferentiationInterface,
# you might have a unified function to compute derivatives.
# (Check the latest docs for details.)
#
# For now, if you need AD functionality, you can use ForwardDiff or Zygote as shown above.
println("DifferentiationInterface provides a unified interface for AD backends. See its documentation for the current API.")
