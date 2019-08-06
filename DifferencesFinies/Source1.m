function S = Source(z,t)
  
    global dz;
    
    %% Initialaisation du vecteur source
    S = zeros(length(z),1);
    
    %% Terme source initial, source ponctuelle amelioree
    if t <= 2
      S(floor(length(z)/2)+1)= (0.15/dz) ;
    endif
end