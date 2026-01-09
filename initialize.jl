# Run this and follow the instructions (adding keys to the repo on github).
using DocumenterTools; DocumenterTools.genkeys(user="gefux", repo="MyJuliaExamplePackage.jl")

# Run this to create an empty project.
t = Template(;
    user="gefux",
    authors=["Gerald E. Fux"],
    plugins=[
        License(name="MIT"),
        Git(; ssh=true),
        GitHubActions(),
        Tests(; jet=true),
        Codecov(),
        Documenter{GitHubActions}(),
    ],
)
t("MyJuliaExamplePackage")