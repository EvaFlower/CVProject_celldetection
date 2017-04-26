function [E,O] = findE(img)

E = edge(img,'canny');
X = [1,2,1;0,0,0;-1,-2,-1];
Y = X';
I1 = imfilter(img, X);
I2 = imfilter(img,Y);
O = I2./I1;