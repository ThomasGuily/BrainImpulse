function ut = Impulse (t,u)

  % Déclaration des variables globales
  global D S n mu B1 B2                      %constantes du probleme
  global D0 D2                               %matrices de differentiation
  global xquad wquad                         %parametres pour integration numérique
  global v z                                 %variables necessaires dans les fonctions integrand

  t                                          %affichage de l'instant au quel on calcule la reponse

  % Separation des inconnues et calcul de la source
  v= u(1:n);
  w= u(n+1:2*n);
  %S=Source(z,t);
  %S=Source1(z,t);
  S=Source2(z,t);

  % Partie lineaire des equations
  vt= - mu*D0*v - D0 * w + D*D2*v;
  wt= B1*D0*v - B2*D0*w;

  % Partie non lineaire de la 1ere equation
  y1= feval('integrand1' ,xquad')*wquad' ;
  y2= feval('integrand2' ,xquad')*wquad' ;

  vt(1:n-1)=vt(1:n-1)+y1;
  vt(2:n)=vt(2:n)+y2;
  
  %Implementation des conditions aux limites
  vt(1)=vt(1)-v(1);
  vt(n)=vt(n)-v(n);
  wt(1)=wt(1)-w(1);
  wt(n)=wt(n)-w(n);
  
  ut=[vt; wt];

endfunction