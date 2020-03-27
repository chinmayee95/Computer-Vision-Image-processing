function [freq] = dist_norm_l2(descriptor, centroids)

[vr vc] = size(centroids);
[dr dc] = size(descriptor);

euclidean_distance = zeros(128);
cur_distance = 0.0;
idx =0;
freq = zeros(128);

for i=1:dr
    for k=1:vr
        for j=1:dc
            difference = (descriptor(i,j)-centroids(k,j));
            cur_distance = cur_distance + power(difference , 2);
        end
        euclidean_distance(k) = (sqrt(cur_distance));
        cur_distance = 0.0;
    end
    minimum_distance = euclidean_distance(1);
    idx = 1;
    
    for k=1:vr
        if (minimum_distance>euclidean_distance(k))
            minimum_distance = euclidean_distance(k);
            idx = k;
        end
    end
    freq(idx) = freq(idx) + 1;
    
end
end

