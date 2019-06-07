function vt = inttemp (t,v)
  global n De D2L D0L v1 xquad wquad mu;
  
  v1=v;
  
  %partie lineaire
  
  vt= De*D2L*v - mu*D0L*v;
  
  %partie non lineaire
  
  y1= feval('integrand1' ,xquad')*wquad';
  y2= feval('integrand2' ,xquad')*wquad';
  
  vt(1:n-1,1) = vt(1:n-1,1)-y1;
  vt(2:n,1) = vt(2:n,1)-y2;
  
  %condition aux limites
  
  vt(1,1)= vt(1,1)-(v(1)-0);
  vt(n,1)= vt(n,1)-(v(n)-0);
  
endfunction
