
real function interp_tp(T,P,vlu,tlu,pilu,plu)
	
	implicit none
	
	interface
		integer function interval(x,xi)
			real, intent(in) :: x
			real, intent(in), dimension(:) :: xi
		end function interval
		real function interp_1d(x,xi,yi)
			real, intent(in) :: x
			real, intent(in), dimension(:) :: xi, yi
		end function interp_1d
	end interface
	
	real, intent(in) :: T, P
	real, dimension(:), intent(in) :: vlu ,tlu, plu
	integer, dimension(:), intent(in) :: pilu 
	
	integer :: n, np
	integer :: pi1, pi2, i1, i2, i3
	real :: v1, v2, p1, p2, dp, TT, PP
	
	n=size(vlu)
	np=size(plu)
	
	! check range
	PP=P
	if ( PP < plu(1) ) then
		PP = plu(1)
	else if ( PP> plu(np) ) then
		PP = plu(np)
	end if
	
	TT=T
	if ( TT < tlu(1) ) then
		TT = tlu(1)
	else if ( TT > tlu(n) ) then
		TT = tlu(n)
	end if
	
	! interpolate along to constant pressure curves
	pi1=interval(PP,plu)  
	pi2=pi1+1
	i1=pilu(pi1)
	i2=pilu(pi2)
	i3=pilu(pi2+1)
	p1=plu(pi1)
	p2=plu(pi2)
	dp = p2-p1
	
	v1 = interp_1d( TT, tlu(i1:i2-1), vlu(i1:i2-1) )
	v2 = interp_1d( TT, tlu(i2:i3-1), vlu(i2:i3-1) )
	
	interp_tp = v1 * (p2-PP)/dp + v2 * (PP-p1)/dp
	
end function interp_tp