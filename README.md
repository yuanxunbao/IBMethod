# IBMethod
Codes developed for the Immersed Boundary Method of Peskin
by Yuanxun (Bill) Bao with contributions from Jason Kaye, Alex Kaiser, Courant Institute

The new C3 5pt and 6pt kernels are implemented in flex5pt.m and flex6pt.m. Their derivation can be found in (see references there-in for the standard 3-point and 4-point Peskin kernels), see file IBKernelNote.pdf:

 "Gaussian-Like immersed-boundary kernels with three continuous derivatives and improved translational invariance"
 by Yuanxun Bao, Alexander D. Kaiser, Jason Kaye, Charles S. Peskin, http://arxiv.org/abs/1505.07529
 
Also implemented is the standard 4-point B-spline, which can be obtained by repeatedly convolving a hat function with itself (http://www.chebfun.org/examples/approx/BSplineConv.html). Note these are not Peskin kernels per se and are not constructed with specific care to grid invariance but they are nevertheless useful, notably, they are smoother than the Peskin kernels and in the limit of infinite support they approach a Gaussian kernel.

Directory IBKernels:
------------------------------------

1. contains codes for computing IB kernels and routines for computing weights used in force spreading and velocity interpolation.

2. deltaCK.m deltaCKplot.m are Matlab codes demonstrating the new Gaussian-like 6pt IB kernel

3. Matlab codes for IB kernels are stnd3pt.m, stnd4pt.m, bspline4pt.m, flex6pt.m. First derivatives of the 4pt B-spline and the new 
6pt kernels are also available in bspline4pt_d.m and flex6pt_d.m. The C version of these kernels are available in Kernels.c.

4. phiweights.m computes weights of spreading/interpolation in 1D. To get weights in 2D/3D, one needs to compute a tensor product. The C version is available in KernelGrid2D.c and KernelGrid3D.c. No tensor product is required as the C codes already take care of it. 

5. to obtain MEX executables of KernelGrid2D.c and KernelGrid3D.c to speed up computing IB weights, execute in Matlab:
mex KernelGrid2D.c Kernels.c

Directory DemoStandardIB
------------------------------------

1. contains codes for a demo of a 2D elastic membrane immersed in a viscous incompressible fluid. Spatial discretization of the fluid domain is based on the staggered(MAC) grid. The main time-stepping scheme is the 2nd order Adams-Bashforth method.

3. NS2D_IBMACmain.m is the main program. Users can set fluid parameters, grid resolutions, choice of IB kernel and other parameters in this code. 

3. NS2D_IBMAC.m is called by NS2D_IBMACmain.m to carry out the main steps of the simulation.

4. spreadMAC2Dvector.m and interpMAC2Dvector.m: force spreading and velocity interpolation to the MAC grid. Users have the option to use MEX excutables to speed up calcuation of weights. 

5. NavierStokes2D_FFT.m: a FFT-based 2D Navier-Stokes fluid solver, used in the main loop of time stepping

6. NavierStokes2D_FFT_RK.m: a FFT-based 2D Navier-Stokes fluid solver, used only in the beginning to get another initial condition via RK2
