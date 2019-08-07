function S = Source(z,t)
    global k dz;
    
    %% Initialisation du vecteur source
    S = zeros(length(z),1);
    Who = (2*k + 1)*dz ; 
    
    %% Terme source initial, source elargie
    if t <= 2
      S(floor(length(z)/2)+1 - k : floor(length(z)/2)+1 + k )= (0.15/Who) ;
    endif
end