function controller_jt_draw(x)

    l2=1;

    xtip = l2*cos(x(1,:))*(x(2,:) + 0.5);
    ytip = l2*sin(x(1,:))*(x(2,:) + 0.5);

    axis([-0.5 1.5 -0.5 1.5])

    hold on;

    axis square

    draw_circle(0.5,0.5,0.25);

    %plot([0,0], [0,0],'r','LineWidth',0.1)
    plot([0,xtip], [0,ytip],'r','LineWidth',0.1)
 

 drawnow;