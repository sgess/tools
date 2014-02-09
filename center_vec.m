function out_vec = center_vec(in_vec,axis_vec,center_ind,center_val,warn)
% function out_vec = center_vec(in_vec,axis_vec,center_index)
% 
% This functions "centers a vector". It shifts a vector "in_vec"
% such that the "center_index" position lines up with the "center_val" 
% position in "axis_vec".
%
% e.g.: in_vec       = [1 2 3 2 1]
%       axis_vec     = [-3 -2 -1 0 1 2 3]
%       center_index = 3
%       center_val   = 0
%     ->out_vec      = [0 1 2 3 2 1 0]

if nargin < 5; warn = 1; end;
if numel(axis_vec) < numel(in_vec); error('axis_vec must be longer than in_vec'); end;

% ind_c will be the index in out_vec that in_vec will be centered on
[val, ind_c] = min(abs(axis_vec - center_val));

% n_out is the size of center_vec and out_vec
% n_above is the number of positions between ind_c and the end of center_vec
% n_below is the number of positions between 1 and ind_c, including ind_c
n_out = numel(axis_vec);
n_above = n_out - ind_c;
n_below = ind_c;

% n_in is the size of in_vec
% nin_above is the number of positions between center_ind and the end of in_vec
% nin_below is the number of positions between 1 and center_ind, including center_ind
n_in  = numel(in_vec);
nin_above = n_in - center_ind;
nin_below = center_ind;

% create empty out_vec
out_vec = zeros(1,n_out);

if nin_above < n_above && nin_below < n_below
    
    out_vec((n_below-nin_below+1):(n_below-nin_below+n_in)) = in_vec;
    
else
    
    if warn; warning('bad programmer'); end;
    
end

% i should write more code here. . .