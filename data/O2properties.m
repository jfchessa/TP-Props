clear
load O2Data.mat;

T     = O2Data(:,1);
P     = O2Data(:,2);
rho   = O2Data(:,3);
cp    = O2Data(:,4);
gamma = O2Data(:,5);
mu    = O2Data(:,6);
kappa = O2Data(:,7);

figure(1)
scatter3(T,P,rho)
title('O_2 Density [lbf-s^2/in^4]')
xlabel('Temperature [R]')
ylabel('Pressure [psia]')
view(44,32)

figure(2)
scatter3(T,P,cp)
title('O_2 Isobaric Specific Heat [in^2/(s^2-R)]')
xlabel('Temperature [R]')
ylabel('Pressure [psia]')
view(44,32)

figure(3)
scatter3(T,P,gamma)
title('O_2 Specific Heat Ratio, \gamma')
xlabel('Temperature [R]')
ylabel('Pressure [psia]')
view(44,32)

figure(4)
scatter3(T,P,mu)
title('O_2 Dynamic Viscosity [lbf-s/in^2]')
xlabel('Temperature [R]')
ylabel('Pressure [psia]')
view(44,32)

figure(5)
scatter3(T,P,kappa)
title('O_2 Thermal Conductivity [lbf/(s-R)]')
xlabel('Temperature [R]')
ylabel('Pressure [psia]')
view(44,32)

write_ludata('o2rho.inc',T,P,rho);
write_ludata('o2cp.inc',T,P,cp);
write_ludata('o2gamma.inc',T,P,gamma);
write_ludata('o2mu.inc',T,P,mu);
write_ludata('o2kappa.inc',T,P,kappa);

