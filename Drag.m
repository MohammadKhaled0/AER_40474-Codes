clc,clear,close all
Re=6378;
h=(500:50:1000);
A=0.25;
CD=2.2;
m=100;
mu = 398600;
t=double(zeros(1,length(h)));

for i=1:length(h)
a=h(i)+Re;
a_new=a;
dt=0;
while(a_new>Re+300)
rho=atmosphere(a_new-Re);                     %(kg/m^3)
Delta_a=-2*pi*(CD*A/m)*rho*(1000*a_new)^2;    %m
T = 2*pi*sqrt((a_new)^3/mu);                  %sec 
dt = T + dt;
a_new=a_new+Delta_a/1000;
end
t(i)=dt;
end
years=t/365.25/3600/24;
plot(h,years)
grid on
title('Altitude Vs Life time')
xlabel('h [km]')
ylabel('t [years]')
