close all
clear all


%% Declaration des variables
global z k B1 B2 D n mu D2 dz;


%% Definition des parametres
D = 0.01;
mu =  0.08 ;
k = 1; 
tmax= 200;
pas=0.2;
z0 = 0;
zL = 50;
n = 1501;
B1 = 0.008;
B2 = 2.54*B1;

%% Creation de la grille spatio temporelle
dz = (zL - z0)/(n - 1);
z = z0:dz:zL; 
z = z';
t=0:pas:tmax;
t = t';

%% Approximation de la derivee seconde
D2 = three_point_centered_D2(z);

%% Conditions initiales (vecteur initial)
v0 = zeros (length(z),1);
w0 = zeros (length(z),1);
u0 = [v0;w0];

%% Initiation de Ode

options=odeset('RelTol',1e-5,'AbsTol',1e-5,'stats','on','jpattern', sparse (spones([eye(n) + spones(D2), eye(n); eye(n),  eye(n)])));


%% Lancement du chronometre
tic

%% Appel de Ode (Ode45 ici)
[tout, yout] = ode15s(@Impulse,t,u0,options);


%% Receuil de v (on laisse tomber w)
yout = yout (:,1 :length(z));

%% Arret et lecture du chronometre
tcpu=toc;
tcpu

%% Visualisation graphique
Visualizer(z,t,yout);




