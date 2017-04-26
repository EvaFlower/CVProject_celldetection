function img = Area(img)

[a,b]=size(img);
for i=1:a;
    for j=1:b;
        if(sqrt((i-a/2)^2+(j-b/2)^2)>240)
            img(i,j)=0;
        end
    end
end