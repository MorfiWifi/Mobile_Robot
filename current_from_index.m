function out = current_from_index (index , data)
%x* (data.alpha / data.d) + (y *(1 / data.d));

%out.y = mod(index , ((data.alpha / data.d)) / (1 / data.d));
%index  = index - out.y;
%out.x = index / (data.alpha / data.d);



tempx = index - mod(index , (data.alpha/data.d));
out.x = (tempx / (data.alpha/data.d)) * data.d ;
out.y = (index - tempx) * data.d;
end