subroutine eos( T, P, mix, rho, drho, mu, dmu, kappa, dkappa,
	   gamma, dgamma, cp, dcp )
	  
!     Subroutine to compute the thermodynamic properties of the 
!     film cooling fluid
!
!     mix - mass ratio of LOX to CH4
!
! 	  rho - fluid density [slinch/in^3]
! 	  kappa  - themal conductivity [] 
! 	  gamma  -  cp/cv []
!     mu - viscosity []
! 	  cp - specific heat at constant pressure [ ]
! 	  
! 	  drho - change in density w.r.t. temperature
! 	  dkappa - change in kappa w.r.t. temperature  
! 	  dgamma - change in gamma w.r.t. temperature
! 	  dmu - change in mu w.r.t. temperature
! 	  dcp  - change in cp w.r.t. temperature
!
	use o2props_mod, only : O2_RHO, O2_MU, O2_KAPPA, O2_GAMMA, O2_CP
	!use ch4props_mod, only : CH4_RHO, CH4_MU, CH4_KAPPA, CH4_GAMMA, CH4_CP
	
	implicit none

	real, intent(in) :: T, P, mix
	real, intent(out) :: rho, mu, kappa, gamma, cp
	real, intent(out) :: drho, dmu, dkappa, dgamma, dcp
	
	real, parameter :: DT = 10.0

	rho   = O2_RHO(T,P)
	mu   = O2_MU(T,P)
	kappa = O2_KAPPA(T,P)
	gamma = O2_GAMMA(T,P)
	cp    = O2_CP(T,P)
	
	drho   = ( O2_RHO(T+0.5*DT,P)   - O2_RHO(T-0.5*DT,P) )/DT
	dmu    = ( O2_MU(T+0.5*DT,P)    - O2_MU(T-0.5*DT,P) )/DT
	dkappa = ( O2_KAPPA(T+0.5*DT,P) - O2_KAPPA(T-0.5*DT,P) )/DT
	dgamma = ( O2_GAMMA(T+0.5*DT,P) - O2_GAMMA(T-0.5*DT,P) )/DT
	dcp    = ( O2_CP(T+0.5*DT,P)    - O2_CP(T-0.5*DT,P) )/DT
	 
end subroutine	eos 