close all
clear all

% Déclaration des variables globales
global D B1 B2 mu k                     %constantes du probleme
global z0 zL n dz z h                   %grille spatiale
global xquad wquad                      %integration numerique
global v0 w0 u0                         %condition initiales
global D0 D2                            %matrices de differentiation           

% Grille spatiale
z0 = 0;
zL = 50;
n = 201;
nel = n-1;
dz = (zL - z0)/nel;                     %pas spatiale
z = (z0:dz:zL)';                        %vect colonne des coordonées
h= z(2)-z(1);                           %z equidistants=> 1 seule valeure de h

%constantes du probleme
D = 0.01;
mu =  0.08 ;
k=3;
B1 = 0.008;
B2 = 2.54*B1;
ne=2;                                   %nombre d'eq aux der partielles

%matrices de differentiation
D0=lagrD0_1(h,n);
D0=sparse(D0); 
D2=lagrD2_1(h,n);
D2=sparse(D2);

% Conditions initiales
v0 = zeros (1,n);
w0 = zeros (1,n);
u0 =[v0 w0];

%instants de visualisation
dt=0.2;
tmax= 200;
t=0:dt:tmax;                             %vect des instants de visualisation
nt=length(t);                            %nombre d'instants de visualisation

%parametres pour integration numérique
nquad = 2;
beta = .5./sqrt(1-(2*(1:nquad)).^(-2));
T=diag(beta,1) + diag(beta,-1);
[V,De]= eig(T);
xquad=diag(De);
[xquad,i] = sort(xquad);
wquad = 2*V(1,i).^2;

% Lancement du chronomètre
tic

%integration temporelle
options= odeset('Mass' ,masseL1(h,n,ne));
[tout,yout] = ode15s(@Impulse ,t,u0,options);
yout = yout (:,1 :length(z));             %eliminer les valeurs de w de la solution

% Arrêt et lecture du chronomètre
tcpu=toc;
tcpu

%affichage de la solution
Visualizer(z,t,yout);



