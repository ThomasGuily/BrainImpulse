function ut = Impulse (t,u)

  % Déclaration des variables globales
  global D S n mu B1 B2                      %constantes du probleme
  global D0 D2                               %matrices de differentiation
  global xquad wquad                         %parametres pour integration numérique
  global v z                                 %variables necessaires dans les fonctions integrand

  t                                          %affichage de l'instant au quel on calcule la reponse

  % Separation des inconnues et calcul de la source
  v= u(1:2*n);
  w= u(2*n+1:4*n);
  S1=Source2(z,t);
  S(1:2:2*n-1)=S1;
  S(2:2:2*n)=S1;
  % Partie lineaire des equations
  vt= - mu*D0*v - D0 * w + D*D2*v;
  wt= B1*D0*v - B2*D0*w;

  % Partie non lineaire de la 1ere equation
  y1= feval('integrand1' ,xquad')*wquad' ;
  y2= feval('integrand2' ,xquad')*wquad' ;
  y3= feval('integrand3' ,xquad')*wquad' ;
  y4= feval('integrand4' ,xquad')*wquad' ;
  
  %vt(1:n-1)=vt(1:n-1)+y1;
  %vt(2:n)=vt(2:n)+y2;
  vt(1:2:2*n-3)=vt(1:2:2*n-3) + y1;
  vt(2:2:2*n-2)=vt(2:2:2*n-2) + y2;
  vt(3:2:2*n-1)=vt(3:2:2*n-1) + y3;
  vt(4:2:2*n)=vt(4:2:2*n) + y4;
  
  %Implementation des conditions aux limites
  vt(1)=vt(1)-v(1);
  vt(2*n-1)=vt(2*n-1)-v(2*n-1);
  wt(1)=wt(1)-w(1);
  wt(2*n-1)=wt(2*n-1)-w(2*n-1);
  
  ut=[vt; wt];

endfunction