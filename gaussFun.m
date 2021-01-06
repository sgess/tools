function g = gaussFun(z_ax,sz,pz,N)

g = N*exp(-(z_ax-pz).^2/(2*sz^2));
