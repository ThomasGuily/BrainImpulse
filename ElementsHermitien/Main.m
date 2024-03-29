close all
clear all

% D�claration des variables globales
global D B1 B2 mu k                     %constantes du probleme
global z0 zL n dz z h                   %grille spatiale
global xquad wquad                      %integration numerique
global v0 w0 u0                         %condition initiales
global D0 D2                            %matrices de differentiation      
global N1 u S     

% Grille spatiale
z0 = 0;
zL = 50;
n = 201;
nel = n-1;
dz = (zL - z0)/nel;                     %pas spatiale
z = (z0:dz:zL)';                        %vect colonne des coordon�es
h= z(2)-z(1);                           %z equidistants=> 1 seule valeure de h

%constantes du probleme
D = 0.01;
mu =  0.08 ;
k=3;
B1 = 0.008;
B2 = 2.54*B1;
ne=2;                                   %nombre d'eq aux der partielles

%matrices de differentiation
D0=herD0_1(h,n);
D0=sparse(D0); 
D2=herD2_1(h,n);
D2=sparse(D2);
%Changer le nom des fonction pour hermite

% Conditions initiales
v0 = zeros (1,n);
v0x = zeros (1,n);
w0 = zeros (1,n);
w0x = zeros(1,n);
%u0 =[v0 w0];
u0(1:2:2*n-1) = v0;
u0(2:2:2*n) = v0x;
u0(2*n+1:2:4*n-1) = w0;
u0(2*n+2:2:4*n)=w0x;

%instants de visualisation
dt=0.2;
tmax= 200;
t=0:dt:tmax;                             %vect des instants de visualisation
nt=length(t);                            %nombre d'instants de visualisation

%parametres pour integration num�rique
nquad = 2;
beta = .5./sqrt(1-(2*(1:nquad)).^(-2));
T=diag(beta,1) + diag(beta,-1);
[V,De]= eig(T);
xquad=diag(De);
[xquad,i] = sort(xquad);
wquad = 2*V(1,i).^2;

% Lancement du chronom�tre
tic

%integration temporelle
options= odeset('Mass' ,masseH1(h,n,ne)); %changer masse pour Hermite
[tout,yout] = ode15s(@Impulse ,t,u0,options);
yout = yout (:,1:2:2*length(z));          %eliminer les valeurs de w et vx de la solution

% Arr�t et lecture du chronom�tre
tcpu=toc;
tcpu

%affichage de la solution
Visualizer(z,t,yout);



