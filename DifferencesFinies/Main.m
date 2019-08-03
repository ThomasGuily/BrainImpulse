close all
clear all

% Lancement du chronomètre



% Déclaration des variables


global i B1 B2 D z0 zL n mu dz z D1c;


u = zeros (2,length (z));
% Définition des paramètres

D = 0.01;
mu =  0.08 ;

% Grille spatiale
i=0;
tmax= 200;
pas=0.2;
z0 = 0;
zL = 50;
n = 401;
B1 = 0.008;
B2 = 2.54*B1;
dz = (zL - z0)/(n - 1);
z = z0:dz:zL; 
z = z';
t=0:pas:tmax;
t = t';

D1c = three_point_centered_D2(z);

% Conditions initiales

v0 = zeros (length(z),1);
w0 = zeros (length(z),1);
u0 = [v0;w0];


% Conditions régissant la valeur de la source en un point x




% Appel à la fonction ODE45

tic
options=odeset('RelTol',1e-5,'AbsTol',1e-5,'stats','on');
[tout, yout] = ode45(@Impulse,t,u0,options);
%name='ODE 45';
yout = yout (:,1 :length(z));
% Arrêt et lecture du chronomètre

tcpu=toc;
tcpu

% Graphique

Visualizer(z,t,yout);




