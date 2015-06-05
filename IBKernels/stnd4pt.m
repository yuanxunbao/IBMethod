% ----------------------------------------------------------------------- %
% Author: Jason Kaye
% Date: June 2013
% Description: Standard 4-point Kernel for IBM
%
% Conditions:
% ---------------------------------------------------------------------
% | Support | Odd/Even | 1st Mom. | 2nd Mom. | 3rd Mom. | Sum Squares |
% ---------------------------------------------------------------------
% |  4-pt   |    x     |     x    |          |          |   C = 3/8   |
% ---------------------------------------------------------------------
%
% ----------------------------------------------------------------------- %

function phi=stnd4pt(r)

r = abs(r);
phi = (1/8)*(...
    (r<1).*(3-2*r+sqrt(1+4*r-4*r.^2)) +...
    (1<=r & r<2).*(5-2*r-sqrt(-7+12*r-4*r.^2)));

end