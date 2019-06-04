%%
clc;
or = 180 ; % degree
sh = 90; % degree should

x = mod(sh - or , 360) % Left Turn pos Direction
y = -(mod(360 - x , 360))

%mod(360 + 450 , 360)

% OK!...................

%% using Crated Function .....
or = 112.5 ; % degree
sh = 90;
out = min_rot(or,sh);
num2str(out)

% OK!.......................


%% test rand

data = build_gols(data);

%% tes is any
% data.sx = 64; % start possition
% data.sy = 30; 

isinany(63, 30 , 0 )

%% tst circuit!
% on the Line is 0! is math > 0 out side < 0 in side
clc;
x = 20;
y = 75;
r = 5; % radios
x0 = 15;
y0 = 75;
res = (x0 - x).^2 + (y0 - y).^2 - (r.*r) 

