function [N1 N2 N3 N4] = hermitfct(x)
    N1=0.25*(1-x)^2*(2+x);
    N2=0.25*(1-x^2)*(1-x);
    N3=0.25*((1+x)^2)*(2-x);
    N4=0.25*(-1+(x^2))*(1+x);
endfunction
