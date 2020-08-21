# # Modal analysis of acoustic medium in a rigid box

# ## Description

# Example from Boundary element acoustics: Fundamentals and computer codes, TW
# Wu, page 123. Internal resonance problem. Reference frequencies: 90.7895,
# 181.579, 215.625, 233.959, 272.368, 281.895 Quadrilateral mesh.

# ## Goals

# - Construct the discrete model and solve the eigenvalue problem for the
#   natural frequencies.
# - Visualize eigenmodes.

##
# ## Definitions

# The finite element code realize on the basic functionality implemented in this
# package.
using FinEtools
# The acoustics functionality is brought in:
using FinEtoolsAcoustics

# In order to solve the eigenvalue problem we need the Arnoldi package.
import Arpack: eigs


# The input quantities are provided without units, but the units are consistent:
rho = 1.21*1e-9;# mass density
c  = 345.0*1000;# millimeters per second
bulk =  c^2*rho;
Lx = 1900.0;# length of the box, millimeters
Ly = 800.0; # length of the box, millimeters
n = 14;#
neigvs = 18;
OmegaShift = 10.0;

# The mesh covers a rectangle.
fens,fes = Q4block(Lx,Ly,n,n); # Mesh

# Construct the geometry and the pressure field.
geom = NodalField(fens.xyz)
P = NodalField(zeros(size(fens.xyz,1),1))
# There are no boundary conditions explicitly needed: The box has hard sound
# boundary conditions all around. Number the unknowns in the pressure field.
numberdofs!(P)

# The finite element machine for acoustics is constructed. The integration
# rule is appropriate to the four node quadrilaterals.
femm = FEMMAcoust(IntegDomain(fes, GaussRule(2, 2)), MatAcoustFluid(bulk,rho))

# Compute the stiffness and mass matrices:
S = acousticstiffness(femm, geom, P);
C = acousticmass(femm, geom, P);
    
# And now solves eigenvalue problem. Note that the acoustic mass is singular,
# and we need to use shifting to ensure convertibility of the first matrix.
evals, evecs, nconv = eigs(C+OmegaShift*S, S; nev=neigvs, which=:SM)
evals = evals .- OmegaShift;
fs = real(sqrt.(complex(evals)))./(2*pi)
println("Eigenvalues: $fs [Hz]")
    
# Postprocessing: export all pressure modes.
File =  "rigid_box.vtk"
scalarllist = Any[]
for n  = 1:15
    push!(scalarllist, ("Pressure_mode_$n", evecs[:,n]));
end
vtkexportmesh(File, connasarray(fes), geom.values, FinEtools.MeshExportModule.VTK.Q4;
scalars=scalarllist)
@async run(`"paraview.exe" $File`)
    
true
  