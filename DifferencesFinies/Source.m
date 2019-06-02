function S = Source(z,t)

    S = zeros(length(z),1);
    
    if t <= 2 :
      S(25)=0.15;
    endif
    if > 2 :
      S(25) = 0;
    endif

end

