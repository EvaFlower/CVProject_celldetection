function [Px,Py]=findpeakII(Ir,T)

[c,b]=size(Ir);
l=1;
[ls,ps]=meanshift(T,20);
    for i = 1:size(ps,2);
        M=find(ls==i);
        A = zeros(size(M,2),6);
        X = T(1,M);Y=T(2,M);
        F = zeros(size(M,2),1);
        for j = 1:size(M,2);
            F(j,1)=Ir(X(j),Y(j));
        end
        for k = 1:size(M,2)
             A(k,:)=[1,X(k),Y(k),Y(k)*X(k),X(k)^2,Y(k)^2];
        end
        B = A';
        a = ((B*A)^-1)*B*F;
        Pxx = round((a(3)*a(4)-2*a(2)*a(6))/(4*a(5)*a(6)-a(4)^2));
        Pyy = round((a(2)*a(4)-2*a(3)*a(5))/(4*a(5)*a(6)-a(4)^2));
        if Pxx>0&&Pxx<b&&Pyy>0&&Pyy<c
            Px(l)=Pxx;
            Py(l)=Pyy;
            l = l+1;
        end
    end 