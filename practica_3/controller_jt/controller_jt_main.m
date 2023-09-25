clear all
close all
clc

init;

x = [0; 0; 0; 0]; % Estado inicial
u = [0; 0];

dt=0.01;

frame_counter=0;
 
Kp = [70, 0;
      0, 90];

Kd = [8, 0;
      0, 16];

I1 = 1;
I2 = 1;
m2 = 1;
d2 = 0.5;
l2 = 1;
r = 0.25;
g = 9.81;

for t=0:dt:25

    x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    x4 = x(4);

    px = l2*cos(x1)*(x2 + d2);
    py = l2*sin(x1)*(x2 + d2);
    
    p = [px;py];

    pd = [0.5;0.5] + r*[cos(0.25*t);sin(0.25*t)];
    dotpd = r*[-sin(0.25*t);cos(0.25*t)];
    ddotpd = r*[-cos(0.25*t);-sin(0.25*t)];

    % Jacobian
    J = [-sin(x1)*(d2 + x2), cos(x1);
        cos(x1)*(d2 + x2), sin(x1)];

    Jdot = [-sin(x1)*x4 - cos(x1)*(d2 + x2)*x3, -sin(x1)*x3;
            cos(x1)*x4 - sin(x1)*(d2 + x2)*x3, cos(x1)*x4];

    N = m2*g*[x2*cos(x1);
              sin(x1)];

    B = [I1+I2+m2*x2^2, 0;
        0, m2];

    C = [2*m2*x2*x3*x4;
        -m2*x2*x3^2];

    v = inv(J)*(ddotpd + Kd*(dotpd-J*[x3;x4]) + Kp*(pd-p) - Jdot*[x3;x4]);
    
    u = B*v+C+N;

    x = x + controller_jt_f(x,u)*dt; % Euler
    %x=x+dt*(0.25*controller_jt_f(x,u)+0.75*(controller_jt_f(x+dt*(2/3)*controller_jt_f(x,u),u))); % Runge-Kutta
    
    frame_counter = frame_counter+1;
    pause(dt);

    % Frame sampling
    if frame_counter == 10
        %plot(t,x(1),'k--.',t,x(2),'r--.',t,u(1),'g--.', t,u(2),'b--.');
        controller_jt_draw(x);
        frame_counter =0;
    end
end