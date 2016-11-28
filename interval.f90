integer function interval(x,xi)

	implicit none
	
	real, intent(in) :: x
	real, intent(in), dimension(:) :: xi
	
	integer :: n, il, iu, ii
	
	n=size(xi)
	il = 1
	iu = n
	do 
		ii = (iu+il)/2
		
		if ( x > xi(ii) ) then
			il = ii
		else
		    iu = ii
		end if
		
		if ( iu - il == 1 ) then
			exit
		end if
		
	end do 
	
	interval = il
	
end function interval