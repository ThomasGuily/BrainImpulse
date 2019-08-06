function out = integrand11(z)
  global n mu S ub u1 u2
  %global u1 u2 N1 N2 her
  
  %her=z;
  u1=ub(1:n-1);
  u2=ub(2:n);
  
  for i =1:length(z) 
    [N1, N2] = trialfunctionslagr_1(z(i));
    
    u=N1*u1+N2*u2;

    out(1:n-1,i)=N1*((mu+1)*u .^2 -u .^3);    
  endfor
  
endfunction
