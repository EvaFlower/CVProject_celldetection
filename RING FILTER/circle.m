function h = circle(a,b,r)

theta = 0:pi/50:2*pi;
x = r*cos(theta)+a;
y = r*sin(theta)+b;
h = plot(x, y);






