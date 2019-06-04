clc;
time = 0;
d = 0.1; % density of map
size = 0 ;

x = 0;
y = 0;

x_index = 1;
y_index = 1;

while x <= 100 
   while y <= 100
       %disp(x);
       %disp(y);
       
       if(isinany(x,y,time) > 0)
            size = size + 1;
            %disp(isborder(x,y,time)); 
       end
       y = y + d;
   end
   x = x + d;
   y = 0;
end

xs = zeros(1 ,size);
ys = zeros(1 ,size);

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

res.xs = xs;
res.ys = ys;

plot (xs , ys , 'r*');

%% Test .....


disp(isborder(59.9,25,0)); 