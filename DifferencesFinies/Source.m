function S = Source(z,t)

    S = zeros(length(z),1);
    
    if t <= 2
      S(length(z)/2)=0.15;
    endif
    if t > 2
      S(length(z)/2) = 0;
    endif

end