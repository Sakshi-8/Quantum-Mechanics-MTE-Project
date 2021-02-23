%%% SIMPLE POTENTIAL WELL 
%%% we will be using finite difference method for solving ordinary
%%% differential equations

clear all;
clc;
close all;

%%% asking for what energy state do you want
m = input("what energy state do you want?? \n");
%%% writing the constants first
m_e = 9.1e-31;
h = 6.626e-34/2*pi;
width = 4e-9;
% width of quantum well
V_max = 1; % these units will be in eV
V_min = 0;

%%% Now we are gonna define the space by 
d = 0.1e-9;
z = -20e-9:d:20e-9;

%%%defining the potential over space
V = zeros(size(z));
V(z < -width ) = V_max;
V(z > width ) = V_max;
V(z < width & z > -width) = V_min;
V1=V;
%%% we will be making the hamiltonian now
% first calculating the Kinetic ebergy 
[x y] = size(z);
K = eye(y,y)*(-2);
a=ones(y-1,1);
K = K + diag(a,1) + diag(a,-1);

%calculating the potential now

V = diag(V);

% Finally adding them both to make the Hamiltonin, we get

H = K*(-(h)^2/2*m_e*(d^2)) + V;

%%% getting the eigen value and eigen vector for these values

[eig_vec , eig_val] =  eig(H); % here the eig value gives the value of energy eigen states
% and  eig_vec in different columns give value of the wave function at different places

%%%%%%%%%%%%%%%%%%%%%%%%
C = 1;
s=10e110;
a=0;
t = a*s;% put the value for time here..
%  this is the time part
T = C*exp(-i*eig_val(m,m)*t/h);
T_real = real(T);
T_imag = imag(T);

Wave_fucntion = eig_vec(:,m)* T;
Wave_fucntion_r = real(Wave_fucntion);
Wave_fucntion_i = imag(Wave_fucntion);
 hold on

plot(z,Wave_fucntion_r)
plot(z,Wave_fucntion_i)
plot(z,V1)
legend('wave function(real part)','wave function(complex part)')
grid on
xlabel("x")
ylabel("wave function")
title("Finite potential well")
    


