
function ut = Impulse (t,u)

global D S n mu B1 B2
global D0 a0 D2 D00 D02
global xquad wquad
global ub z
t


ub=u(1:n); %pour passer u aux fontions integrand

%if (size(u)(1)==1)
 % u=u';
%endif

v= u(1:n);
w= u(n+1:2*n);

%partie lineaire

  vt= - mu*D00*v - D00 * w + D*D02*v;
  wt= B1*D00*v - B2*D00*w;

%partie non lineaire

  S=Source(z,t);
  
  %separation de u en v et w pour utiliser integrand1 et 2
  y1= feval('integrand1' ,xquad')*wquad' ;
  y2= feval('integrand2' ,xquad')*wquad' ;
  
  vt(1:n-1)=vt(1:n-1)+y1;
  vt(2:n)=vt(2:n)+y2;
  vt=vt+S;
  

%conditions aux limites

  vt(1)=vt(1)-v(1);
  vt(n)=vt(n)-v(n);
  wt(1)=wt(1)-w(1);
  wt(n)=wt(n)-w(n);
  
  ut=[vt; wt];


endfunction