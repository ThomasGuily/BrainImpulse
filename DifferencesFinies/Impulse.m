
function [ Vt ] = Impulse(t,v)

    % Définitions des variables

    global  z D D1c mu w; %D1c D1u

    t
    
    % Condition aux limites 

    
    
    % Dérivée temporelle
 
    w = VariableAnnexe (z,t,v); % A créer encore
    S = Source(z,t);

    Vt = D*D1c(1,:)*D1c(1,:)' + v*(v-1)'*(mu-v) - w + S;

end