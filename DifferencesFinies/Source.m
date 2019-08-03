function S = Source(z,t)

    S = zeros(length(z),1);
    
    if t <= 2
      S(floor(length(z)/2)+1)=0.15;
    endif
end