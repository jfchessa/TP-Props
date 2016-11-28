real function interp_1d(x,xi,yi)

	implicit none
	
	interface
		integer function interval(x,xi)
			real, intent(in) :: x
			real, intent(in), dimension(:) :: xi
		end function interval
	end interface
	
	real, intent(in) :: x
	real, intent(in), dimension(:) :: xi, yi
	
	integer :: il, iu
	real :: dx
	
	il = interval(x,xi)
	iu = il+1
	
	dx = xi(iu) - xi(il)
	interp_1d = yi(il) * (xi(iu)-x)/dx + yi(iu) * (x-xi(il))/dx
	
end function interp_1d