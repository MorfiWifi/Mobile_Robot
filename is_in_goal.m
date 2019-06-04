function data = is_in_goal(data,num_of_goal)
x = data.x;
y = data.y;
r = 5; % radios
x1 = 10;
y1 = 90;

x2 = 90;
y2 = 90;

if num_of_goal == 1 
    res = (x1 - x).^2 + (y1 - y).^2 - (r.*r) ;
else
    res = (x2 - x).^2 + (y2 - y).^2 - (r.*r) ;
end
data.is_goal = res;
end

