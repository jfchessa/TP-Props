function stat = write_ludata( fname, T, P, val )
% function stat = write_ludata( fname, T, P, val )
%
% Write thermophysical property data to a fortran 90 type initialization

f = fopen(fname,'w');
if ( f<0 )
    stat=1;
    return
end

ndl = 8;
n = length(val);
plu = unique(P);
np = length(plu);

pilu=zeros(np+1,1);
for i=1:np
    ii = find( P==plu(i), 1 );
    pilu(i)=ii;
end
pilu(np+1)=n+1;

fprintf(f,'  integer, parameter :: n=%d, np=%d\n', n, np);

fprintf(f,'  real, dimension(n), parameter :: vlu = &\n\t\t(/ ');
for i=1:n-1
    if ( mod(i,ndl)==0 )
        fprintf(f,' &\n\t\t');
    end
    fprintf(f,'%f, ',val(i));
end
fprintf(f,'%f /)\n',val(n));

fprintf(f,'  real, dimension(n), parameter :: tlu = &\n\t\t(/ ');
for i=1:n-1
    if ( mod(i,ndl)==0 )
        fprintf(f,' &\n\t\t');
    end
    fprintf(f,'%f, ',T(i));
end
fprintf(f,'%f /)\n',T(n));

fprintf(f,'  integer, dimension(np+1), parameter :: pilu = &\n\t\t(/ ');
for i=1:np
    if ( mod(i,2*ndl)==0 )
        fprintf(f,' &\n\t\t');
    end
    fprintf(f,'%d, ',pilu(i));
end
fprintf(f,'%d /)\n',pilu(np+1));

fprintf(f,'  real, dimension(np), parameter :: plu = &\n\t\t(/ ');
for i=1:np-1
    if ( mod(i,ndl)==0 )
        fprintf(f,' &\n\t\t');
    end
    fprintf(f,'%f, ',plu(i));
end
fprintf(f,'%f /)\n',plu(np));

fclose(f);
stat=0;

end

