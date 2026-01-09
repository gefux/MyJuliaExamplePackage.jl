using MyJuliaExamplePackage
using Documenter

DocMeta.setdocmeta!(MyJuliaExamplePackage, :DocTestSetup, :(using MyJuliaExamplePackage); recursive=true)

makedocs(;
    modules=[MyJuliaExamplePackage],
    authors="Gerald E. Fux",
    sitename="MyJuliaExamplePackage.jl",
    format=Documenter.HTML(;
        canonical="https://gefux.github.io/MyJuliaExamplePackage.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/gefux/MyJuliaExamplePackage.jl",
    devbranch="main",
)
