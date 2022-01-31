# This file was generated, do not modify it. # hide
using Plots

x = range(-5, 5, length=1000)

M = [ 2 ; -2 ]
B = [ 3 ; -2 ]
L1(x) = M[1]*x + B[1]
L2(x) = M[2]*x + B[2]

plot(x, L1.(x))
plot!(x, L2.(x))