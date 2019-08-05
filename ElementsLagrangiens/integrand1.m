function out = integrand1(z)
  global n mu S ub;
  
  u1=ub(1:n-1);
  u2=ub(2:n);
  
  for i =1:length(z) 
    [N1, N2] = trialfunctionslagr_1(z(i));
    
    out(1:n-1,i)= N1*((mu+1)*((u1*N1).^2 + 2*(u1*u2*N1*N2) +...
    (u2*N2).^2) - (N1*u1).^3 - (3*(N1*u1).^2 * N2 * u2) -...
    (3*N1*u1*(N2*u2).^2) - (N2*u2).^3 + S);
  endfor
  
endfunction
