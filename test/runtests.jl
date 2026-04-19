using MyJuliaExamplePackage
using Test
using JET

  @testset "MyJuliaExamplePackage.jl" begin
  @testset "Code linting (JET.jl)" begin
    JET.test_package(MyJuliaExamplePackage; target_defined_modules = true)
  end

  @testset "Main func" begin
    @test foofunc(3,4) == 11
  end
  @testset "Max weight clique" begin
    adj = [0 1 1 0;
          1 0 1 0;
          1 1 0 0;
          0 0 0 0]
    weights = [1.0, 2.0, 3.0, 4.0]

    clique, total = max_weight_clique(adj, weights)
    @test Set(clique) == Set([1, 2, 3])
    @test total == 6.0
  end
end
