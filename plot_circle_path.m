function  plot_circle_path( input )
% Plot The Curv returned from mobile_invers!!!
if(double( input.res.finale_teta) < double(input.res.current_teta))
    if(input.res.w < 0)
        th = double(input.res.finale_teta):0.01:double(input.res.current_teta);
    else
        th = double(input.res.current_teta):0.01:double(input.res.finale_teta + 2*pi);
    end
    %th = double(input.res.current_teta):-0.01:double(input.res.finale_teta);
else
    if (input.res.w < 0)
        th = double(input.res.finale_teta):0.01:double(input.res.current_teta + 2*pi);
    else
        th = double(input.res.current_teta):0.01:double(input.res.finale_teta);
    end
    
    
end
circle(input.x0,input.y0,1,1, input.teta0);
hold on
r = input.res.r;
x = input.res.rx;
y = input.res.ry;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
plot(xunit, yunit , 'r-' );

xunit = (r+1) * cos(th) + x;
yunit = (r+1) * sin(th) + y;
plot(xunit, yunit , 'g-');

xunit = (r-1) * cos(th) + x;
yunit = (r-1) * sin(th) + y;
plot(xunit, yunit ,'g-');

plot(input.res.rx, input.res.ry ,' b*');

if (isfield(input,'txs') && isfield(input,'tys'))
    plot(input.txs, input.tys , 'b.');
end
hold off
circle(input.x1,input.y1,1,1, input.res.final_or);


end

