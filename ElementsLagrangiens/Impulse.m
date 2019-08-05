
function ut = Impulse (t,u)

global D S n
global D0 a0 D2
global xquad wquad
global ub z
t


ub=u; %pour passer u aux fontions integrand

%if (size(u)(1)==1)
 % u=u';
%endif

%partie lineaire

  ut= a0.*D0*u + D*D2*u;

%partie non lineaire

  S=Source(z,t);
  
  %separation de u en v et w pour utiliser integrand1 et 2
  y1= feval('integrand1' ,xquad')*wquad' ;
  y2= feval('integrand2' ,xquad')*wquad' ;
  
  %y1=[y1 zeros(1,n)];
  %y2=[y2 zeros(1,n)];
  %y1=[y1 zeros(n,1)];
  %y2=[y2 zeros(n,1)];
  
  ut(1:n-1,1) = ut(1:n-1,1) + y1;
  ut(2:n,1) = ut(2:n,1) + y2;
  ut(1:n,1) = ut(1:n,1)+S; 
  

%conditions aux limites

  ut(1,1) = ut(1,1) - u(1);
  ut(n,1) = ut(n,1) - u(n);
  ut(n+1,1) = ut(n+1,1) - u(n+1);
  ut(2*n,1) = ut(2*n,1) - u(2*n);

endfunction