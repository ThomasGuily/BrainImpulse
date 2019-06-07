
function [ Vt ] = Impulse(t,v)

    % D�finitions des variables

    global  i z D D1c mu w; 

    t
    
    % Condition aux limites 

    v(1) = 0;
    v (length (z)) = 0;
    
    % D�riv�e temporelle
    
    w = VariableAnnexe (z,t,v); 

    
    S = Source(z,t);
    

    
    
    Vt = D*D1c*z + v.*(v-1).*(mu-v) - w + S;

end