function out = min_rot(or,sh)
%or = 180 ; % degree
%sh = 270; % degree should

x = mod(sh - or , 360); % Left Turn pos Direction
y = -(mod(360 - x , 360));

if abs(x) < abs (y)
    out = x;
else
    out = y;
end
end

