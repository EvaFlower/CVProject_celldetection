function F = ringfilter2(r,w)

d = 2*(r+2)+1;
C = zeros(d,d);
for i=1:d;
    for j = 1:d;
        if sqrt((i-d/2-1)^2+(j-d/2-1)^2)<r;
            C(i,j)=1;
        else 
            C(i,j)=0;
        end
    end
end
C2 = zeros(d,d);
for i=1:d;
    for j = 1:d;
        if sqrt((i-d/2-1)^2+(j-d/2-1)^2)<r-w;
            C2(i,j)=1;
        else 
            C2(i,j)=0;
        end
    end
end
s = r^2-(r-w)^2;
F = C-C2;
F = (F-s/d^2)/(s*(1-s/d^2));


