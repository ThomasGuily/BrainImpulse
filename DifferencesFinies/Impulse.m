
function [ Vt ] = Impulse(t,v)

    % Définitions des variables

    global  z D S0 Dlc; %D1c D1u

    t
    
    % Condition aux limites 

    
    
    % Dérivée temporelle
    w = VariableAnnexe (z,t); % A créer encore
    S = Source(z,t);

    Vt = D*Dlc*Dlc + v*(v-1)*(mu-v) - w + S;

end
    

    


