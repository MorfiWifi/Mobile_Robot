function data = draw_obs(data)
time = data.time;

time = int32(time);
time = double(time);
%disp(time);

data.fill_obs = 0; % never fill them ...
d = 0.5 ;%data.d; % density of map should be 1
size = 0 ;

x = 0;
y = 0;

x_index = 1;
y_index = 1;

if data.fill_obs > 0
    while x <= 100 
       while y <= 100
           if(isinany(x,y,time) > 0)
                size = size + 1;
           end
           y = y + d;
       end
       x = x + d;
       y = 0;
    end

    %size
    xs = zeros(1,size);
    ys = zeros(1,size);

    x=0;
    y=0;
    while x <= 100 
       while y <= 100
           if(isinany(x,y,time) > 0)
              xs(1 , x_index) = x ;
              ys(1 , y_index) = y ;
              x_index = x_index + 1;
              y_index = y_index + 1;
           end
           y = y + d;
       end
       x = x + d;
       y = 0;
    end

    data.txs = xs;
    data.tys = ys;
else
    d = 0.5 ; % ? onl can work with this density !! -hell don't know
    while x <= 100 
       while y <= 100
           if(isborder(x,y,time) > 0)
                size = size + 1;
           end
           y = y + d;
       end
       x = x + d;
       y = 0;
    end

    %size
    xs = zeros(1,size);
    ys = zeros(1,size);

    x=0;
    y=0;
    while x <= 100 
       while y <= 100
           if(isborder(x,y,time) > 0)
              xs(1 , x_index) = x ;
              ys(1 , y_index) = y ;
              x_index = x_index + 1;
              y_index = y_index + 1;
           end
           y = y + d;
       end
       x = x + d;
       y = 0;
    end

    data.txs = xs;
    data.tys = ys;
    
end


end

