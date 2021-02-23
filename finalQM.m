%%% Quantum Harmonic Oscillator 
%%% we will be using finite difference method for solving ordinary
%%% differential equations
clc; clear all; close all;


a=-6; b=6; N=1001;
x=linspace(a,b,N);
h=x(2)-x(1);
h_bar=6.626e-34/(2*pi);

%%%defining the kinetic energy for the case
K=eye(N)*(-2);
i=ones(N-1,1);
K=K+diag(i,1)+diag(i,-1);

%%%defining the potential for the harmonic well
V_arr=(x.^2)/800;
V=diag(V_arr);

%%% getting the hamiltonian
H=-K/(2*h^2)+V;

n=input('Enter energy state: ');

%%% we will get the eigan vectros which will be the wave functions
%%% and the eigen value which represents the energy states 

%%% this only gives the Time independant wave equation 
[wave_func e_val]=eig(H);


%%%
for t=0:5e-37:5e-35
    % now we multiply the time part in order to get the complete wave
    % equation
    wave_func=wave_func*exp(-j*e_val(n,n)*t/h_bar);
    subplot(1,2,1);
    plot(x,real(wave_func(:,n)));
    hold on;
    plot(x,imag(wave_func(:,n)));
    plot(x,V_arr);
    hold off
    axis([-inf inf -0.05 0.05]);
    grid on
    xlabel("x") 
    ylabel("wave function")
 
    
    legend("wave function(real part)","wave function(imaginary part)","Potential well")
    subplot(1,2,2);
    plot(x,(abs(wave_func(:,n))).^2);
    hold on
    grid on
    legend('probability density')
    pause(0.001);
    xlabel("x")
    ylabel("probability density")
     hold off
end

%{
subplot(122);
plot(x,wave_func(:,n).^2);
hold on;
plot(x,V_arr);
grid on;
hold off;
%}