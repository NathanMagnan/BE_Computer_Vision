function [im_out] = ad_hoc_filter(im_in, level)
s = size(im_in);
n = s(1);
m = s(2);

im_out = zeros(n, m);

for i = 1:n
    for j = 1:m
        if (im_in(i, j) > level)
            im_out(i, j) = 255;
        end
    end
end
end