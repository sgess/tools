function out_mat = medfilt2(in_mat)

r = 3;     % Adjust for desired window size
k = 5;     % Select the kth largest element

A = zeros([size(in_mat), r^2]);
for i=1:r^2
    w = zeros(r);
    w(i) = 1;
    A(:,:,i) = filter2(w, in_mat);
end

B = sort(A,3);
out_mat = squeeze(B(:,:,k));