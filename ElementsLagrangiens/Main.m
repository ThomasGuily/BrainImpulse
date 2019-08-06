close all
clear all

% Lancement du chronomètre

tic

% Déclaration des variables globales

global D B1 B2 mu         %constantes du probleme
global z0 zL n dz z h     %grille spatiale
global xquad wquad        %integration numerique
global v0 w0 u0           %condition initiales
global D0 a0 D2           %construction equation 
%global u1 u2 N1 N2 her S %h1 h2 h3 h4
% Définition des paramètres

% Grille spatiale

z0 = 0;
zL = 50;
n = 201;
%nel = n-1;
dz = (zL - z0)/(n - 1); %pas spatiale
z = (z0:dz:zL)'; %vect colonne des coordonées
%h= (z(2:n) - x(1:n-1))'; %vect des long des differents elements
h= z(2)-z(1); %z equidistants=> 1 seule valeure de h

%Matrices de différentiation

D2= lagrD2_1(h,n);
D0L=lagrD0_1(h,n);

%constantes du probleme
D = 0.01;
mu =  0.08 ;
B1 = 0.008;
B2 = 2.54*B1;
ne=2; %nombre d'eq aux der partielles

%matrices de differentiation

D00=lagrD0_1(h,n);
D0=[D00 D00 ; D00 D00];
D0=sparse(D0); 

a= diag([repmat(-mu,1,n)],0) + diag([repmat(-mu,1,n-1)],1) + diag([repmat(-mu,1,n-1)],-1);
b= diag([repmat(-1,1,n)],0) + diag([repmat(-1,1,n-1)],1) + diag([repmat(-1,1,n-1)],-1);
c= diag([repmat(B1,1,n)],0) + diag([repmat(B1,1,n-1)],1) + diag([repmat(B1,1,n-1)],-1);
d= diag([repmat(-B2,1,n)],0) + diag([repmat(-B2,1,n-1)],1) + diag([repmat(-B2,1,n-1)],-1);

a0=[a b ; c d];
a0=sparse(a0);

D02=lagrD2_1(h,n);
D2=[D02 zeros(n,n); zeros(n,2*n)];
D2=sparse(D2);

% Conditions initiales

v0 = zeros (1,n);
w0 = zeros (1,n);
u0 =[v0 w0];


%instants de visualisation

dt=0.2;
tmax= 200;
t=0:dt:tmax; %vect des instants de visualisation
nt=length(t); %nombre d'instants de visualisation

%parametres integration numérique

nquad = 2;
beta = .5./sqrt(1-(2*(1:nquad)).^(-2));
T=diag(beta,1) + diag(beta,-1);
[V,De]= eig(T);
xquad=diag(De);
[xquad,i] = sort(xquad);
wquad = 2*V(1,i).^2;

%integration temporelle

options= odeset('Mass' ,masseL1(h,n,ne));
[tout,yout] = ode15s(@Impulse ,t,u0,options);

yout = yout (:,1 :length(z)); %eliminer les valeurs de w de la solution

%affichage de la solution

Visualizer(z,t,yout);

% Arrêt et lecture du chronomètre

tcpu=toc;
tcpu

