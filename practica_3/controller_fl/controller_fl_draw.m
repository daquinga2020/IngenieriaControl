function controller_fl_draw(x)

    l2=1;

    xtip = l2*cos(x(1,:))*(x(2,:) + 0.5);
    ytip = l2*sin(x(1,:))*(x(2,:) + 0.5);

    axis([-1 1 -1 2])

    hold on;

    axis square

    plot([0,xtip], [0,ytip],'r','LineWidth',0.1)
 

 drawnow;