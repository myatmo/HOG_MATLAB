function ori_histo = BuildHistogram(grad_mag, grad_angle, cell_size)
%Input: grad_mag and grad_angle are the magnitude and orientation of the gradient
%images (size: m × n); cell_size is the size of each cell, which is a positive integer.
%Output: ori_histo is a 3D tensor with size M × N × 6 where M and N are the
%number of cells along y and x axes, respectively, i.e., M = m/cell_size and N =
%n/cell_size where b·c is the round-off operation as shown in Figure 4(a).
%Description: Given the magnitude and orientation of the gradients per pixel, you can
%build the histogram of oriented gradients for each cell.
m = size(grad_mag,1);
n = size(grad_angle,2);
M = m/cell_size;
N = n/cell_size;
nbins = 6;

ori_hisito = zeros(M,N,nbins);

im_filtered = zeros(size(im));
center_k = floor(size(filter,1)/2)+1;

center_l = floor(size(filter,2)/2)+1;
for i = 1 : size(im,1)
    for j = 1 : size(im,2)
    % filtering
        v = 0;
        for k = 1 : size(filter,1)
            for l = 1 : size(filter,2)
                i1 = i + k - center_k;
                j1 = j + l - center_l;
                if i1 <= 0 || i1 > size(im_filtered,1) || j1 <= 0 || j1 > size(im_filtered,2)
                    continue;
                end
                v = v + im(i1,j1)*filter(k,l);
            end
        end
        im_filtered(i,j) = v;
    end
end