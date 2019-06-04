%% part 2
single_r_time = 0.1571;
total_r_time = 0;
clc;
[m,n] = size(P);
xs = [];
ys = [];
clc;
% Create CenterLine
x1 = 0;
y1 = 0;
x2 = 0;
y2 = 0;

hold on;
circle(2 , 2 , 2 , teta); % Draw Firs Robot (start point)
for i=1:1:n
   index = P(1 ,i); 
   out =  current_from_index (index , Res);
   
   
   y = out.y;
   x = out.x;
   %x = uint8(x);
   %y = uint8(y);
   x = int32(x);
   y = int32(y);
   xs = [xs , x];
   ys = [ys , y];
   if(i>2)
       x1 = xs(1,i-1);
       y1 = ys(1,i-1);
       x2 = xs(1,i-2);
       y2 = ys(1,i-2);
       a = abs(x2 - x1) + abs (x1 - x);
       b = abs (y2 - y1) + abs (y1 - y);
       %disp(['a = ' num2str(a) ' b = ' num2str(b) ]);



      if( (a == 1 && b == 2) ||( b == 1 && a == 2) )
          xp = (x - x1);
          yp = (y - y1);
          xpp = (x1 - x2);
          ypp = (y1 - y2);
          
          
          if(yp == 1 && ypp == 1)
              if(xp == 0)
                 if(xpp == 1)
                     teta = teta + pi/4;
                 else
                     teta = teta - pi/4;
                 end
              else
                  if(xp == 1)
                     teta = teta - pi/4;
                 else
                     teta = teta + pi/4;
                 end
              end
              
              
          elseif(yp == -1 && ypp == -1)
              if(xp == 0)
                 if(xpp == 1)
                     teta = teta - pi/4;
                 else
                     teta = teta + pi/4;
                 end
              else
                  if(xp == 1)
                     teta = teta + pi/4;
                 else
                     teta = teta - pi/4;
                 end
              end
              
          elseif (xp == 1 && xpp == 1)
              if(yp == 0)
                 if(ypp == 1)
                     teta = teta - pi/4;
                 else
                     teta = teta + pi/4;
                 end
              else
                  if(yp == 1)
                     teta = teta + pi/4;
                 else
                     teta = teta - pi/4;
                 end
              end
              
          elseif(xp == -1 && xpp == -1)
              if(yp == 0)
                 if(ypp == 1)
                     teta = teta + pi/4;
                 else
                     teta = teta - pi/4;
                 end
              else
                  if(yp == 1)
                     teta = teta - pi/4;
                 else
                     teta = teta + pi/4;
                 end
              end
              
              
          end
          
          
          %disp(['xp = ' num2str(xp) ' , yp = ' num2str(yp)]);
          %disp(['xpp = ' num2str(xpp) ' , ypp = ' num2str(ypp)]);
          %xes = [x2, x1 ,x];
          %yes = [y2, y1 ,y];
          %figure;
          %plot(xes , yes , 'r*');
          
          
          circle(x , y , 2 , teta); %Draw circles
          %disp('narrow move');
          total_r_time = total_r_time + single_r_time;
      end
   end
   
   oldx = x;
   oldy = y;
   %disp(['x is = ' x]);
   %disp(['y is = ' y]);
end

% Uper Line
disp(['total time taken for rotation = ' num2str(total_r_time)]);


% adding back Ground!
xys = show_xys(0);
%xs = [xs , xys.xs];
%ys = [ys , xys.ys];
plot(xs ,ys);
plot(xys.xs , xys.ys , '*');
hold off;
