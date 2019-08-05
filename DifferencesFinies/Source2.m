function S = Source(z,t)
    global k n1 dz i;
    S = zeros(length(z),1);
    Who = (2*k + 1)*dz ; 
    
    if t <= 2
      S(floor(length(z)/2)+1 - k : floor(length(z)/2)+1 + k )= (0.15/Who) ;
    endif
    

end