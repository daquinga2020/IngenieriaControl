
function  xdot  = f(x,u)
% state x = (x,y,theta,theta_r,v,delta)
% control u=(u1 u2)
L=3;
L_r=5;

px=x(1);
py=x(2);
theta=x(3);
%%%%%

%%%%%
theta_r=x(4);
v=x(5);
delta=x(6);

xdot=[v*cos(delta)*cos(theta); v*cos(delta)*sin(theta); v*sin(delta)/L; (v*cos(delta)*sin(theta-theta_r))/L_r; u(1); u(2)];
end

