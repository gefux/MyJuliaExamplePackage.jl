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
end
