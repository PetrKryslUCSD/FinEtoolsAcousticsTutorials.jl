using Documenter, FinEtools, FinEtoolsAcousticsTutorials

makedocs(
	modules = [FinEtoolsAcousticsTutorials],
	doctest = false, clean = true,
	format = Documenter.HTML(prettyurls = false),
	authors = "Petr Krysl",
	sitename = "FinEtoolsAcousticsTutorials.jl",
	pages = Any[
	"Home" => "index.md",
	"Tutorials" => "tutorials/tutorials.md",
	]
	)

deploydocs(
    repo = "github.com/PetrKryslUCSD/FinEtoolsAcousticsTutorials.jl.git",
)
