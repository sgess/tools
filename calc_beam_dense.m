function density = calc_beam_dense(N,sigma_x,sigma_y,sigma_z)

sig_x_cm = sigma_x/1e4;
sig_y_cm = sigma_y/1e4;
sig_z_cm = sigma_z/1e4;

density = N/((2*pi)^(3/2)*sig_x_cm*sig_y_cm*sig_z_cm);