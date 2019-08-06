## Copyright (C) 2019 ThomasGPhonk
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} Visualizer (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ThomasGPhonk <ThomasGPhonk@DESKTOP-7FS6V1P>
## Created: 2019-06-04

function  Visualizer(z,t,yout)
  clf;
  
  #Creation de la grille
  #[xx, yy] = meshgrid (z,t); 
  mesh(z,t,yout);
  title ("Amplitude d'un signal à partir d'une impulsion d'amplitude 0.15 en z = 25 appliquée entre t=0 et t=2");
  xlabel "z (position)";
  ylabel "t (temps)";
  zlabel "v (amplitude du signal)";

endfunction
