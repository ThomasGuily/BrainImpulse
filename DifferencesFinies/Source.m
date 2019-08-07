function S = Source(z,t)
  
    %% Initialisation du vecteur source
    S = zeros(length(z),1);
    
    %% Terme source initial, source ponctuelle
    if t <= 2
      S(floor(length(z)/2)+1)=0.15;
    endif
end