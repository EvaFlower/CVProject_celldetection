function [H1,A,B,R] = houghcircle2(img,O,E,r_min,r_max,r_step)

[rows,cols] = find(E==1);
[m,n] = size(img);
B = 1:m;
A = 1:n;
R = r_min:r_step:r_max;
step_angle = 1;
H1 = zeros(n,m);
H = zeros(n,m,size(R,2));
for i = 1:size(rows,1);
    for k = -180:1:179;
        for j = 1:size(R,2);
            a = ceil(cols(i)-R(j)*cosd(k*step_angle));
            b = ceil(rows(i)-R(j)*sind(k*step_angle));   
            if a>0&&a<n&&b>0&&b<m&&(cols(i)-a)/(rows(i)-b)<-O(rows(i),cols(i))+0.5&&(cols(i)-a)/(rows(i)-b)>-O(rows(i),cols(i))-0.5
                H(a,b,j) = H(a,b,j)+1;
            end
        end
    end
end
for i = 1:n;
    for j = 1:m;
        H1(i,j) = sum(H(i,j,:));
    end
end
