
function  Visualizer(z,t,yout)
  clf;
  
  %% Création de la figure
  mesh(z,t,yout);

  title ('Amplitude du signal source appliquee entre t=0 et t=2');
  xlabel 'z (position)';
  ylabel 't (temps)';
  zlabel 'v (amplitude du signal)';

end
