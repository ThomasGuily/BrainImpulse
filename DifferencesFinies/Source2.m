function S = Source2(z,t)
    global k dz;
    
    %% Initialisation du vecteur source
    S = zeros(length(z),1);
    W = (2*k + 1)*dz ; 
    
    %% Troisième terme source, elargissement du stimulus
    if t <= 2
      S(floor(length(z)/2)+1 - k : floor(length(z)/2)+1 + k )= (0.15/W) ;
    endif
end