img = imread('00001.jpg');
img = im2double(img);
img1=Area(img);
[E,O] = findE(img1);
figure;imshow(E);
r1=12;r2=13;r3 = 0.5;
[H,A,B,R] = houghcircle2(img1,O,E,r1,r2,r3);
mx = max(H(:));
figure;imshow(img);hold on
title('12 13');

    [q1,q2] = find(H>0.7*mx);
    a = size(q1,1);
    if a > 0;
      for j=1:a;
        circle(q1(j),q2(j),r1);
      end
    end

hold off