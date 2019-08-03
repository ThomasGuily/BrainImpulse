
function [ ut ] = Impulse(t, u)

    % Définitions des variables

    global i z D D1c mu B1 B2; 

    t
    
    
    % Condition aux limites 
    
    
    S = Source(z,t);
    v = u(1:length (z))' ;
    w = u(length(z)+1:2*length(z))';
    
    
    v (1) = 0;
    v(length(z)) = 0 ;
    w (1) = 0;
    w(length(z)) = 0 ;
    
    % Dérivée temporelle
    
    
    
    %C = [(v.*(v-1).*(mu-v) - w + S)';(B1*v - B2*w)'] ;
    vt = D*D1c*z + (v.*(v-1).*(mu-v))' + (- w + S')';
    
    wt = (B1*v - B2*w)';
    ut = [vt;wt];
    

end