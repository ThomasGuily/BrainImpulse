
function [ Vt ] = Impulse(t,v)

    % D�finitions des variables

    global  z D D1c mu w; %D1c D1u

    t
    
    % Condition aux limites 

    
    
    % D�riv�e temporelle
 
    w = VariableAnnexe (z,t,v); % A cr�er encore
    S = Source(z,t);

    Vt = D*D1c(1,:)*D1c(1,:)' + v*(v-1)'*(mu-v) - w + S;

end