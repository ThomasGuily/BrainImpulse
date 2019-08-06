function out = integrand4(z)
  global n mu S ub;
  
  u1=ub(1:n-3);
  u2=ub(2:n-2);
  u3=ub(3:n-1);
  u4=ub(4:n);
  
  for i =1:length(z)
    [N1 N2 N3 N4] = trialfunctionsher_1(z(i));
    u = N1*u1 + N2 * u2+ u3 * N3+ u4 * N4;
    out(1:n-1,i)=N4*((mu+1)*u.^2-u.^3);
  endfor
  
endfunction
