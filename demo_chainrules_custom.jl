# demo_chainrules_custom.jl

using ChainRulesCore, ChainRulesTestUtils

# Define a custom function
my_square(x) = x^2

# Define a custom reverse-mode derivative rule (rrule) for my_square.
function ChainRulesCore.rrule(::typeof(my_square), x::Real)
    y = my_square(x)
    function my_square_pullback(Δy)
        # The derivative of x^2 is 2x.
        # Return NoTangent() for non-differentiable parts and 2x * Δy for x.
        return (NoTangent(), 2x * Δy)
    end
    return y, my_square_pullback
end

# Compute the derivative using the custom rrule
x_val = 3.0
y, back = ChainRulesCore.rrule(my_square, x_val)
Δy = 1.0  # sensitivity (seed) for reverse-mode AD
_, grad = back(Δy)
expected_grad = 2 * x_val

println("my_square($x_val) = ", y)
println("Computed derivative using custom rrule: ", grad)
println("Expected derivative: ", expected_grad)

# Option 1: Remove or comment out the test if rrule_test is not available.
# rrule_test(my_square, x_val)

# Option 2: If your version provides a testing macro/function, use it as documented.
# For example:
# using ChainRulesTestUtils: @test_rrule
# @test_rrule my_square, x_val
