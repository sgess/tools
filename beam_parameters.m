function [E_peak,n_b,area,n_r,frac_col_ion_he] = beam_parameters(sig_x,sig_y,sig_z,N_b)
% function [E_peak,n_b,area,n_r] = beam_parameters(sig_x,sig_y_sig_z,N_b)
% input:
%   sig_x is horizontal beam size in um
%   sig_y is verical beam size in um
%   sig_z is longitdinal beam size in um
%   N_b is number of beam particles
%
% outputs:
%   E-peak is the peak beam field in GV/m
%   n_b is the beam density in cm^-3
%   area is cross section of beam in cm^2
%   n_r is radial density cm^-2

area = sig_x*sig_y*(1e-4)^2;
n_r = N_b/area;
n_b = N_b/(area*sig_z*1e-4);
E_peak = 10.4*(N_b/1e10)*(10/((sig_x+sig_y)/2))*(50/sig_z);

sig_he = 2e-18; % cm^-2

frac_col_ion_he = N_b*sig_he/area;