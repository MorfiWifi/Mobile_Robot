function graphi = build_graph (d)
% d = density !
s = [];
t = [];
w = [];
tt = 0;
count = 100; %count in Row

for x=1:d:100
    for y=1:d:100
        if(isinany(x,y,tt) == 0)
            if(x+d <= 100)
                % Right
                if(isinany(x+d,y,tt) == 0   )
                    s = [s , ((count*y)+x)];
                    xp = x+d;
                    yp = y;
                    t = [t , ((count*yp)+xp)];
                    w = [w , d];
                end
            end
            
            if(x+d <= 100 && y+d <= 100)
                % Right Up
                if(isinany(x+d,y+d,tt) == 0 )
                    s = [s , ((count*y)+x)];
                    %t = [t , ((x+6) * (y+6))];
                    xp = x+d;
                    yp = y+d;
                    t = [t , ((count*yp)+xp)];
                    w = [w , (sqrt(2)*d)];
                end
            end
            
            
            if(x+d <= 100 && y-d >= 0)
                % Right Down
                if(isinany(x+d,y-d,tt) == 0 )
                    s = [s , ((count*y)+x)];
                    %t = [t , ((x+6) * (y-4))];
                    xp = x+d;
                    yp = y-d;
                    t = [t , ((count*yp)+xp)];
                    w = [w , (sqrt(2)*d)];
                end
            end
            
            if(y+d <= 100)
                % UP
                if(isinany(x,y+d,tt) == 0 )
                    s = [s , ((count*y)+x)];
                    %t = [t , ((x+1) * (y+6))];
                    xp = x;
                    yp = y+d;
                    t = [t , ((count*yp)+xp)];
                    w = [w , d];
                end
            end
        end
    end
end
data.s = s;
data.w = w;
data.t = t;

%graphi = data;
%graph(s,t,w);
  graphi = graph(s,t,w);
end