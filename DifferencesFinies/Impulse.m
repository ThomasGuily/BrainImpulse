function [ ut ] = Impulse(t, u)

    %% D�finitions des variables
    global z D D2 mu B1 B2; 
    
    
    %% Calcul du terme source
    %S = Source(z,t);
    S = Source1(z,t);
    %S = Source2(z,t);
    
    %% Separation du vecteur initiale en v et w
    v = u(1:length (z))' ;
    w = u(length(z)+1:2*length(z))';
    
    %% Conditions aux limites 
    v (1) = 0;
    v(length(z)) = 0 ;
    w (1) = 0;
    w(length(z)) = 0 ;
    
    %% Calcul iteratif(r�ponse directement inseree dans vecteur)
    ut = [D*D2*v' + (v.*(v-1).*(mu-v))' - w' + S;(B1*v - B2*w)'] ;
end