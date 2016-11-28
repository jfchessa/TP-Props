program main
	
	implicit none
	
	interface
		real function interp_1d(x,xi,yi)
			real, intent(in) :: x
			real, intent(in), dimension(:) :: xi, yi
		end function interp_1d
		real function o2_cp(T,P)
			real, intent(in) :: T, P
		end function o2_cp
	end interface
	
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