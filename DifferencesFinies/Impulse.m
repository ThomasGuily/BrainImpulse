
function [ Vt ] = Impulse(t,v)

    % D�finitions des variables

    global  z D S0 Dlc; %D1c D1u

    t
    
    % Condition aux limites 

    
    
    % D�riv�e temporelle
    w = VariableAnnexe (z,t); % A cr�er encore
    S = Source(z,t);

    Vt = D*Dlc*Dlc + v*(v-1)*(mu-v) - w + S;

end
    

    


