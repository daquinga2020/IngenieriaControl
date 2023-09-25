function draw_circle(xcenter,ycenter,radius)
    angle = 0:pi/50:2*pi;
    xcircle = radius * cos(angle) + xcenter;
    ycircle = radius * sin(angle) + ycenter;
    h = plot(xcircle, ycircle,'b','LineWidth',0.1);
end