program main

	use lookup_mod, only : interp_1d
	use o2props_mod, only : O2_CP
	
	implicit none
	
	real, dimension(3) :: xi=(/0.0,1.0,2.0/), yi=(/-1.0,0.0,1.0/)
	real :: y

	write(*,*) "Test driver for eos functions"
	
	write(*,*) "interpolated value for x=0.5 is", interp_1d(0.5,xi,yi)
	write(*,*) "interpolated value for x=1.5 is", interp_1d(1.5,xi,yi)
	write(*,*) "interpolated value for x=1.0 is", interp_1d(1.0,xi,yi)
	write(*,*) "interpolated value for x=0.0 is", interp_1d(0.0,xi,yi)
	write(*,*) "interpolated value for x=2.0 is", interp_1d(2.0,xi,yi)
	
	write(*,*) "Cp interpolated value for T=350 and P=25 is", O2_CP(350.,25.)
	write(*,*) "Cp interpolated value for T=200 and P=20 is", O2_CP(200.,20.)
	write(*,*) "Cp interpolated value for T=-200 and P=20 is", O2_CP(-200.,20.)

end program main