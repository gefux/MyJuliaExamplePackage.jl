
"""
  max_weight_clique(adj, weights)

Solve the maximum-weight clique problem exactly for the graph defined by the
adjacency matrix `adj` and vertex `weights`.

Returns a tuple `(vertices, weight)` where `vertices` is a vector of selected
vertex indices and `weight` is the total weight of the clique.
"""
function max_weight_clique(adj::AbstractMatrix{<:Integer}, weights::AbstractVector{<:Real})
  n = size(adj, 1)
  if size(adj, 2) != n
    throw(ArgumentError("adjacency matrix must be square"))
  end
  if length(weights) != n
    throw(ArgumentError("weights length must match number of vertices"))
  end
  if !issymmetric(adj)
    throw(ArgumentError("adjacency matrix must be symmetric"))
  end

  model = Model(GLPK.Optimizer)
  set_silent(model)
  @variable(model, x[1:n], Bin)
  @objective(model, Max, sum(weights[i] * x[i] for i in 1:n))

  for i in 1:n-1, j in i+1:n
    if adj[i, j] == 0
      @constraint(model, x[i] + x[j] <= 1)
    end
  end

  optimize!(model)
  if JuMP.termination_status(model) != MOI.OPTIMAL
    throw(ErrorException("Max weight clique solver did not reach optimality"))
  end

  selected = [i for i in 1:n if value(x[i]) > 0.5]
  return selected, sum(weights[i] for i in selected)
end

