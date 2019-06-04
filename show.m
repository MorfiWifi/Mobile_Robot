function out = show(t)
xs = [];
ys = [];
for x = 0:1:100
    for y = 0:1:100
        if(isborder(x,y,t) > 0)
            %disp(['x = ' num2str(x) 'y = ' num2str(y)]);
            xs = [xs , x];
            ys = [ys , y];
        end
    end
end
out = 0;
plot(xs,ys , '*');
end