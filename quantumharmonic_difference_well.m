%%% SIMPLE POTENTIAL WELL 
%%% we will be using finite difference method for solving ordinary
%%% differential equations

clear all;
clc;

%%% asking for what energy state do you want
m = input("what energy state do you want?? \n");
%%% writing the constants first
m_e = 9.1e-31;
h = 6.626e-34/2*pi;
width = 4e-9; % width of quantum well
V_max = 1; % these units will be in eV
V_min = 0;
w = 1; % the oscillation of the quantum well

%%% Now we are gonna define the space by 
d = 0.1e-9;
z = -20e-9:d:20e-9;

%%%defining the potential over space... we are basically going to define a
%%%a scalar field
V = zeros(size(z));
V(z < -width ) = V_max;
V(z > width ) = V_max;
x = -width:d:width;
V(z < width & z > -width) = (x.^2)*6e16;
V1=V;
plot(z,V)
%%% we will be making the hamiltonian now
% first calculating the Kinetic energy 
[c y] = size(z);
K = eye(y,y)*(-2);
a=ones(y-1,1);
K = K + diag(a,1) + diag(a,-1);

%calculating the potential now

V = diag(V);

% Finally adding them both to make the Hamiltonin, we get

H = K*(d^2) + V;

%%% getting the eigen value and eigen vector for these values

[eig_vec , eig_val] =  eig(H); % here the eig value gives the value of energy eigen states
% and  eig_vec in different columns give value of the wave function at different places


subplot(2,2,1)
hold on
plot(z',eig_vec(:,m))
plot(z',V1)
legend('wave function(time independant)' ,' potential well' )
grid on
axis([-10e-9 10e-9 -1 1.5])

subplot(2,2,2)
hold on
plot(z',eig_vec(:,m).^2)
plot(z',V1)
legend('probability density(time independant)' ,' potential well' )
grid on
axis([-10e-9 10e-9 -1 1.5])

