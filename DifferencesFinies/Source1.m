function S = Source1(z,t)
  
    global dz;
    
    %% Initialisation du vecteur source
    S = zeros(length(z),1);
    
    %% Deuxième terme source, source ponctuelle amelioree
    if t <= 2
      S(floor(length(z)/2)+1)= (0.15/dz) ;
    end
end