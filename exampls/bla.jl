using Revise
using MyJuliaExamplePackage

A = [0 1 1 0;
     1 0 1 0;
     1 1 0 0;
     0 0 0 0]
W = [1.0, 2.0, 3.0, 4.0]

clique, total = max_weight_clique(A, W)
println("Max weight clique vertices: ", clique)
println("Total weight: ", total)
