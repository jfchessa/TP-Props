
real function O2_RHO(T,P)      

	use lookup_mod, only : interp_tp
	implicit none
	
	real, intent(in) :: T, P
	
	! Define the look up data from .inc file
	include 'o2rho.inc'
	O2_RHO = interp_tp(T,P,vlu,tlu,pilu,plu)
	
end function O2_RHO	

real function O2_CP(T,P)      

	use lookup_mod, only : interp_tp
	implicit none
	
	real, intent(in) :: T, P
	
	! Define the look up data from .inc file
	include 'o2cp.inc'
	O2_CP = interp_tp(T,P,vlu,tlu,pilu,plu)
	
end function O2_CP	

real function O2_MU(T,P)      

	use lookup_mod, only : interp_tp
	implicit none
	
	real, intent(in) :: T, P
	
	! Define the look up data from .inc file
	include 'o2mu.inc'
	O2_MU = interp_tp(T,P,vlu,tlu,pilu,plu)
	
end function O2_MU	

real function O2_GAMMA(T,P)      

	use lookup_mod, only : interp_tp
	implicit none
	
	real, intent(in) :: T, P
	
	! Define the look up data from .inc file
	include 'o2gamma.inc'
	O2_GAMMA = interp_tp(T,P,vlu,tlu,pilu,plu)
	
end function O2_GAMMA	

real function O2_KAPPA(T,P)      

	use lookup_mod, only : interp_tp
	implicit none
	
	real, intent(in) :: T, P
	
	! Define the look up data from .inc file
	include 'o2kappa.inc'
	O2_KAPPA = interp_tp(T,P,vlu,tlu,pilu,plu)
	
end function O2_KAPPA	
