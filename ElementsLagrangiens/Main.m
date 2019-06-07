close all
clear all

% Lancement du chronomètre

tic

% Déclaration des variables

global i B1 B2 D z0 zL n mu dz z D1c w xquad wquad D2L D0L; % D1u

% Définition des paramètres

D = 0.01;
mu =  0.08 ;

% Grille spatiale
i=0;
tmax= 200;
pas=0.2;
z0 = 0;
zL = 50;
n = 1001;
B1 = 0.008;
B2 = 2.54*B1;
dz = (zL - z0)/(n - 1);
z = z0:dz:zL; 
z = z';
t=0:pas:tmax;
t = t';

%lagrange
h=z(2)-z(1);
D2L=lagrD2_1(h,n)
D0L=lagrD0_1(h,n)
ne=1;

%D1u = five_point_biased_upwind_D1(z,1);
D1c = three_point_centered_D2(z);

% Conditions initiales

v0 = zeros (length(z),1);

%parametres integration numerique

nquad = 2;
beta = .5./sqrt(1-(2*(1:nquad)).^(-2));
T=diag(beta,1) + diag(beta,-1);
[V,De]= eig(T);
xquad=diag(De);
[xquad,i] = sort(xquad);
wquad = 2*V(1,i).^2;


% Conditions régissant la valeur de la source en un point x




% Appel à la fonction ODE45


options=odeset('RelTol',1e-5,'AbsTol',1e-5,'stats','on');
[tout, yout] = ode45(@Impulse,t,v0,options);
%name='ODE 45';

Visualizer(z,t,yout);

%Lagrange 
options2= odeset('Mass' ,masseL1(h,n,ne));
[tout2,yout2] = ode15s(@inttemp ,t,v0,options2)

%Visualizer(z,t,yout2)

% Graphique
%Visualizer(z,t,yout);
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

