using ForwardDiff, ForwardDiffChainRules

# Define a function that involves operations with custom chain rules.
g(x) = sqrt(x) + log(x)

# Compute the derivative at x = 4.0 using ForwardDiff.
dg = ForwardDiff.derivative(g, 4.0)

println("Derivative of g(x) at x = 4.0: ", dg)
