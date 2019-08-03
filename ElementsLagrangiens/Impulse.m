
function [ Vt ] = Impulse(t,v)

    % D�finitions des variables

    global  z D D1c mu w S; %D1c D1u

    t
    
    % Condition aux limites 

    v(1) = 0;
    v (length (z)) = 0;
    
    % D�riv�e temporelle
    
    w = VariableAnnexe (z,t,v); % A cr�er encore
    
    S = Source(z,t);
    
    
    Vt = D*D1c*z + v.*(v-1).*(mu-v) - w + S;

end