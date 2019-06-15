function h = circle(x,y,r,or, teta)
% Should Modify Then !

%teta = radian(teta); % ASSUME ITS RADIAN
    if or == 1 
        hold on
        x = double(x);
        y = double(y);
        th = 0:pi/50:2*pi;
        xunit = r * cos(th) + x;
        yunit = r * sin(th) + y;
        h = plot(xunit, yunit,'b');
        xx = ((r*0.9) * cos(teta) + x);
        yy = ((r*0.9) * sin(teta) + y);
        plot(xx , yy , 'r*');
        hold off
    else
        hold on
        x = double(x);
        y = double(y);
        th = 0:pi/50:2*pi;
        xunit = r * cos(th) + x;
        yunit = r * sin(th) + y;
        h = plot(xunit, yunit,'g');
        xx = ((r*0.9) * cos(teta) + x);
        yy = ((r*0.9) * sin(teta) + y);
        plot(xx , yy , 'r*');
        hold off
    end
end