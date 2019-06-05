close all
clear all

% Lancement du chronomètre

tic

% Déclaration des variables

global i B1 B2 D z0 zL n mu dz z D1c w; % D1u

% Définition des paramètres

D = 0.01;
mu =  0.08 ;

% Grille spatiale
i=0;
tmax= 200;
pas=0.2;
z0 = 0;
zL = 50;
n = 100;
B1 = 0.008;
B2 = 2.54*B1;
dz = (zL - z0)/(n - 1);
z = z0:dz:zL; 
z = z';
t=0:pas:tmax;
t = t';

%D1u = five_point_biased_upwind_D1(z,1);
D1c = three_point_centered_D2(z);

% Conditions initiales

v0 = zeros (length(z),1);


% Conditions régissant la valeur de la source en un point x




% Appel à la fonction ODE45


options=odeset('RelTol',1e-5,'AbsTol',1e-5,'stats','on');
[tout, yout] = ode45(@Impulse,t,v0,options);
%name='ODE 45';

% Graphique
Visualizer(z,t,yout);
%prism;
%figure(1);
%plot(z,yout(:,1:n));
%xlabel('z');
%ylabel('v(z,t)');
%titre=['Propagation d’une impulsion électrique',name];
%title(titre);

% Arrêt et lecture du chronomètre

tcpu=toc;
tcpu

