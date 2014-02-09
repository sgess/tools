function [omega_p, lambda_p, skin_depth, plasma_time, plasma_period, E0] = plasma_parameters(n0)
% function [omega_p, lambda_p, skin_depth, plasma_time, plasma_period, E0] = plasma_parameters(n0)
% input:
%   n0 is plasma density in cm^-3
%
% outputs:
%   omega_p is the plasma frequenct in Hz
%   lambda_p is the plasma wavelength in microns
%   skin_depth is c/omega_p in microns
%   plasma time is 1/omega_p in fs
%   E0 is the plasma decelerating field in GV/m

SI_c    = 299792458;       % speed of light  [m/s] 
SI_e    = 1.60217733e-19;  % electron charge [C]
SI_em   = 9.1093897e-31;   % electron mass [kg]
SI_eM   = 0.510998928;     % electron mass [MeV/c^2]
SI_pM   = 938.271996;      % electron mass [MeV/c^2]
SI_re   = 2.81794092e-15;  % classical radius of electron [m]
SI_eps0 = 8.854187817e-12; % permittivity of free space [F/m]
SI_mu0  = 4e-7*pi;         % permeability of free space [T*m/A]

n = n0*100^3;

omega_p = sqrt(n*SI_e^2/(SI_eps0 * SI_em));
lambda_p = 2*pi*SI_c*1e6/omega_p;
skin_depth = SI_c*1e6/omega_p;
plasma_time = 1e15/omega_p;
plasma_period = 2*pi*plasma_time;
E0 = SI_em*SI_c*omega_p/SI_e/1e9;