function [labels,peaks] = meanshift(data,r)

labels = zeros(1,size(data,2));
peaks(:,1) = findpeak2(data,1,r);
labels(1,1)=1;
k = 2;
for i = 2:size(data,2)
    p = findpeak2(data,i,r);
    for j = 1:k-1;
        a = norm(p-peaks(:,j));
        if a<r/2;
            labels(1,i) = j;
            break;
        end
    end
    if labels(1,i) == 0;
         peaks(:,k)=p;
         labels(1,i) = k;
         k = k+1;
    end
end

