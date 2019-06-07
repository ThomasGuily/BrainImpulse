function S = Source(z,t)
    global n1 dz i;
    S = zeros(length(z),1);
    
    if n1 > 2*i
      i = i+1;
      S(floor (length(z)/2) - i) = 0.15/dz;
      S(floor (length(z)/2) + i) = 0.15/dz;
    endif
    

end