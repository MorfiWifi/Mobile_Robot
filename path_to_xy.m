function res = path_to_xy(data)
count = size(data.p);
xs = zeros(1,count(1,2));
ys = zeros(1,count(1,2));

for i=1:1:count(1,2)
   index =  data.p(1,i); 
   xy = current_from_index (index , data);
   xs(1,i) = xy.x;
   ys(1,i) = xy.y;
end
data.xs = xs;
data.ys = ys;

res = data;
end

