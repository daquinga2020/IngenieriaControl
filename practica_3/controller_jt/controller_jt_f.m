function  xdot  = controller_jt_f(x,u)

x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);

u1 = u(1);
u2 = u(2);

I1 = 1;
I2 = 1;
m2 = 1;
g = 9.81;

B = [I1 + I2 + m2*x2^2, 0;
     0, m2];

C = [2*m2*x2*x3*x4;
    -m2*x2*x3^2];

N = m2*g*[x2*cos(x1);
          sin(x1)];

invB = inv(B);

v = -invB*C - invB*N + invB*[u1;u2];

xdot = [x3;x4;v(1);v(2)];

end

