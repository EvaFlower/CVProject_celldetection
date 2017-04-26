P = 'D:\input\'; 
D = dir([P '*.jpg']); 
img = imread([P D(1).name]);
img = im2double(img);
r=11:14;w=6;
[Px1,Py1,rr1]=DetectionCell(img,r,w);
figure;imshow(img);hold on
title(D(1).name);
for i=1:size(Px1,2);
    circle(Py1(i),Px1(i),rr1(i));
    s=int2str(i);
    text(Py1(i),Px1(i),s,'color','r');
end
hold off  
for j = 2:length(D);
    
    img1 = imread(D(j).name);
    img = im2double(img1);
    r=10:13;w=6;
    [Px2,Py2,rr2]=DetectionCell(img,r,w);
    T=[Px1;Py1];
    figure;imshow(img);hold on
    title(D(j).name);
    for k=1:size(Px2,2)
        P=[Px2(k);Py2(k)];
        n2=size(Px1,2);
        mi=min(sqrt(sum((T - repmat(P,1,n2)).^2,1)));
        a=find(sqrt(sum((T - repmat(P,1,n2)).^2,1))==mi);
        circle(Py2(k),Px2(k),rr2(k));
        s=int2str(a);
        text(Py2(k),Px2(k),s,'color','r');
    end
    hold off
    Px1=Px2;Py1=Py2;
end


