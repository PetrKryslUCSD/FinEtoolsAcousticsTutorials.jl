[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://travis-ci.com/PetrKryslUCSD/FinEtoolsAcousticsTutorials.jl.svg?branch=master)](https://travis-ci.com/PetrKryslUCSD/FinEtoolsAcousticsTutorials.jl)
[![Latest documentation](https://img.shields.io/badge/docs-latest-blue.svg)](https://petrkryslucsd.github.io/FinEtoolsAcousticsTutorials.jl/dev)

# FinEtoolsAcousticsTutorials: Acoustics tutorials


[`FinEtools`](https://github.com/PetrKryslUCSD/FinEtools.jl.git) is a package
for basic operations on finite element meshes. [`FinEtoolsAcoustics`](https://github.com/PetrKryslUCSD/FinEtoolsAcoustics.jl.git) is a
package using `FinEtools` to solve acoustics problems. This package provides tutorials for  [`FinEtoolsAcoustics`](https://github.com/PetrKryslUCSD/FinEtoolsAcoustics.jl.git).


## Table of contents

[List of tutorials](docs/src/tutorials/tutorials.md). 

In VS Code the "Markdown: Open preview" command from the "Markdown Preview Enhanced" 
extension  can be used for navigation. 

## How to work with the tutorials

Clone the repo:
```
$ git clone https://github.com/PetrKryslUCSD/FinEtoolsAcousticsTutorials.jl.git
```
Change your working directory into the resulting folder, and run Julia:
```
$ cd FinEtoolsAcousticsTutorials.jl/
$ julia.exe
```
Activate and instantiate the environment:
```
(v1.5) pkg> activate .; instantiate
```
The tutorial source files are located in the `src` folder.
Locate the one you want, loaded in your IDE or editor of preference, and execute away.


## News

- 08/21/2020: Created.
