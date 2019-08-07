function out = integrand2(z)
  global n mu S v h;
  
  u1=v(1:2:2*n-3);
  u2=v(2:2:2*n-2);
  u3=v(3:2:2*n-1);
  u4=v(4:2:2*n);
  
  for i =1:length(z) 
   [N1 N2 N3 N4] = trialfunctionsher_1(z(i));
    u = N1*u1 + N2 * u2+ u3 * N3+ u4 * N4;
    out(1:n-1,i)=(h/2)*N2*((mu+1)*u.^2-u.^3+(S(2:2:2*n-2))');
  endfor
  
endfunction
