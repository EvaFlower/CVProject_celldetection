function peak = findpeak2(data,idx,r)

shift = inf;
peak = data(:,idx);
while(shift>0.1)
    k = 0;
    S = zeros(2,1);
    for i = 1:size(data,2);
        a = norm(data(:,i)-peak);
        if a<=r
            S = S+data(:,i);
            k=k+1;
        end
    end
    mean = S/k;
    shift = norm(mean-peak);
    peak = mean;
end
