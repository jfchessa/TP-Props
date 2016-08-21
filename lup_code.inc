	
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
	