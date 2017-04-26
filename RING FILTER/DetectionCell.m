function [Px,Py,rr]=DetectionCell(img,r,w)
img1 = Area(img);
a=size(r,2);
R1 = ringfilter2(r(1),w); 
Ir1 = imfilter(img1,R1);
mx1 = max(Ir1(:));
[Px1,Py1]=find(Ir1>0.8*mx1);
T1 = [Px1,Py1]';
[Px1,Py1]=findpeakII(Ir1,T1);
Px=Px1;
Py=Py1;
l=size(Px,2);
rr(1:l)=r(1);
for i=2:a;   
    R2 = ringfilter2(r(i),w); 
    Ir2 = imfilter(img1,R2);
    mx2 = max(Ir2(:));
    [Px2,Py2]=find(Ir2>0.8*mx2);
    T2 = [Px2,Py2]';
    [Px2,Py2]=findpeakII(Ir2,T2);
    n1=size(Px2,2);
   
    for j = 1:n1
        T=[Px;Py];
        P=[Px2(j);Py2(j)];
        n2=size(Px,2);
        mi=min(sqrt(sum((T - repmat(P,1,n2)).^2,1)));
        a=find(sqrt(sum((T - repmat(P,1,n2)).^2,1))==mi);
        if(norm(T(:,a)-P)<r(i))
             if Ir1(Px(a),Py(a))<Ir2(Px2(j),Py2(j))
                 Px(a)=Px2(j);
                 Py(a)=Py2(j);
                 Ir1(Px(a),Py(a))=Ir2(Px2(j),Py2(j));
                 rr(a)=r(i);
             end
        else
            Px(l+1)=Px2(j);
            Py(l+1)=Py2(j);
            Ir1(Px(l+1),Py(l+1))=Ir2(Px2(j),Py2(j));
            rr(l+1)=r(i);
            l=l+1;
        end
    end
end

        
            