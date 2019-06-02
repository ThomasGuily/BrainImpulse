close all
clear all

% Lancement du chronom�tre

tic

% D�claration des variables

global D z0 zL n mu dz z D1c; % D1u

% D�finition des param�tres

D = 0.01;
mu =  0.08 ;
% Grille spatiale

tmax= 200;
pas=0.2;
z0 = 0;
zL = 50;
pas2 = 0.1;
z = z0:pas2:zL;

t=0:pas:tmax;
%D1u = five_point_biased_upwind_D1(z,1);
D1c = three_point_centered_D1(z);

% Conditions initiales

v0 = zeros (length(z));


% Conditions r�gissant la valeur de la source en un point x




% Appel � la fonction ODE45


options=odeset('RelTol',1e-3,'AbsTol',1e-3,'stats','on');
[tout, yout] = ode45(@Impulse,t,v0,options);
name='ODE 13tb';

% Graphique

prism;
figure(1);
plot(z,yout(:,1:n));
xlabel('z');
ylabel('v(z,t)');
titre=['Propagation d�une impulsion �lectrique',name];
title(titre);

% Arr�t et lecture du chronom�tre

tcpu=toc;
tcpu

