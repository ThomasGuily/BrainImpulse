function out = integrand1(z)
  global v1 n mu w S;
  
  for i =1:length(z) 
    [N1, N2] = trialfunctionslagr_1(z(i));
    [dN1dx, dN2dx] = der1trialfunctionslagr_1(z(i));
    out(1:n-1,i)=N1*((1+mu)*(N1*v1(1:n-1)+ N2*v1(2:n)) - (N1*v1(1:n-1)+ N2*v1(2:n)) - w(1:n-1) + S(1:n-1));
  endfor
endfunction
