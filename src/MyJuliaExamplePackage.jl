module MyJuliaExamplePackage

using JuMP
using GLPK
using MathOptInterface
const MOI = MathOptInterface

"""
  foofunc(x,y)

Take that x and add the double of that y.
"""
foofunc(x,y) = x + 2y

include("MaxWeightClique.jl")

export foofunc
export max_weight_clique

end
