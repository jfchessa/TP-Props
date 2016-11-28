
real function O2_KAPPA(T,P)      

	implicit none
		
	interface
		real function interp_tp(T,P,vlu,tlu,pilu,plu)
			real, intent(in) :: T, P
			real, dimension(:), intent(in) :: vlu ,tlu, plu
			integer, dimension(:), intent(in) :: pilu 
		end function interp_tp
	end interface
	
	real, intent(in) :: T, P
	
	! Define the look up data from .inc file
	include 'o2kappa.inc'
	O2_KAPPA = interp_tp(T,P,vlu,tlu,pilu,plu)
	
end function O2_KAPPA	