clear all
close all
clc

init;

x = [0; 0; 0; 0]; % Estado inicial
u = [0; 0];

pdA = [-0.5;0.75];
pdB = [0.5;0.25];

dt=0.01;

frame_counter=0;

Kp = [80, 0;
      0, 100];

Kd = [16, 0;
      0, 32];

I1 = 1;
I2 = 1;
m2 = 1;
d2 = 0.5;
l2 = 1;
r = 0.25;
g = 9.81;

for t=0:dt:10

    x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    x4 = x(4);

    px = l2*cos(x1)*(x2 + d2);
    py = l2*sin(x1)*(x2 + d2);
    
    p = [px;py];

    gl = square(0.66*t);
    
    % Jacobian
    J = [-sin(x1)*(d2 + x2), cos(x1);
        cos(x1)*(d2 + x2), sin(x1)];

    Jdot = [-sin(x1)*x4 - cos(x1)*(d2 + x2)*x3, -sin(x1)*x3;
            cos(x1)*x4 - sin(x1)*(d2 + x2)*x3, cos(x1)*x4];

    if gl == 1
        u = J'*Kp*(pdA - p) - J'*Kd*J*[x3;x4];
    else
        u = J'*Kp*(pdB - p) - J'*Kd*J*[x3;x4];
    end

    x = x + controller_fl_f(x,u)*dt; % Euler
    %x=x+dt*(0.25*controller_fl_f(x,u)+0.75*(controller_fl_f(x+dt*(2/3)*controller_fl_f(x,u),u))); % Runge-Kutta

    
    frame_counter = frame_counter+1;
    pause(dt);

    % Frame sampling
    if frame_counter == 10
        %plot(t,x(1),'k--.',t,x(2),'r--.',t,u(1),'g--.', t,u(2),'b--.');
        controller_fl_draw(x);
        frame_counter =0;
    end
end