function out = integrand12(z)
  
  global n mu v h S
  
  u1=v(1:n-1);
  u2=v(2:n);
  
  for i =1:length(z) 
    [N1, N2] = trialfunctionslagr_1(z(i));  
     u=N1*u1+N2*u2;

    out(1:n-1,i)=(h/2)*N2*((mu+1)*u .^2 - u .^3 + S(2:n));
  endfor
  
endfunction
