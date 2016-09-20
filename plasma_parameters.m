function [omega_p, lambda_p, skin_depth, plasma_time, plasma_period, E0, beta_p, k_p, Rb,load] = plasma_parameters(n0,gamma,Et,N)
% function [omega_p, lambda_p, skin_depth, plasma_time, plasma_period, E0, beta_p] = plasma_parameters(n0)
% input:
%   n0 is plasma density in cm^-3
%
% outputs:
%   omega_p is the plasma frequenct in Hz
%   lambda_p is the plasma wavelength in microns
%   skin_depth is c/omega_p in microns
%   plasma time is 1/omega_p in fs
%   E0 is the plasma decelerating field in GV/m
%   beta_p is the betatron wavelength/(2pi) in cm

SI_consts;

n = n0*100^3;

omega_p = sqrt(n*SI_e^2/(SI_eps0 * SI_em));
lambda_p = 2*pi*SI_c*1e6/omega_p;
skin_depth = SI_c*1e6/omega_p;
k_p = omega_p/SI_c;
plasma_time = 1e15/omega_p;
plasma_period = 2*pi*plasma_time;
E0 = SI_em*SI_c*omega_p/SI_e/1e9;

if nargin < 2
    gamma = 20.35e3/SI_eM;
end

beta_p = sqrt(2*gamma)*skin_depth;

if nargin > 2
% Transfomer ratio/beam loading stuff

e_n = 1e-6;          % normalized emittance
gamma = 20.35/.511e-3; % gamma
k_p = 1/(skin_depth*1e-6);    % plasma wave vector

sigma_mat = sqrt(e_n/k_p * sqrt(2/gamma)); % matched sigma r
sigma_z_DB = 1/k_p;                        % match sigma z
%sigma_z_DB = 40e-6

nb = N / (2*pi)^(3/2) / sigma_z_DB / sigma_mat^2; % bunch density
nb_n0 = nb/n0/1e6;                                % normalizaed bunch density

lambda = nb_n0 * (k_p*sigma_mat)^2;               % normalize line charge
Rb = 2/k_p * sqrt(lambda);                        % bubble radius

Q_WB = 0.456*(k_p*Rb)^4/(Et*E0);
load = Q_WB*1e-9/SI_e;

end