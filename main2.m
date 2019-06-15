%% section one

clc();
close();

x = 98;
y = 23;
t = 0;
disp ("is in any obs : " + isinany( x, y ,t) );


data.x = x;
data.y = y;
data.t = t;
res = get_section(data);
disp ("We Are in section : " + res.section  );



%% Using Results OF INStrumenst
clc();
close();
disp("GOD DOSE'T EXIST");
input.x0 = 50;
input.y0 = 40;
input.teta0 =  0;
input.t = 0;
data.x = input.x0;
data.y = input.y0;
data.t = input.t;
res = get_section(data);
disp ("We Are in section : " + res.section  );

input.y1 = 80;
input.x1 = 100;

input.d = 1;
input.time = 0;
input = draw_obs(input);

input = mobile_invers(input);
plot_circle_path(input);

% input2.x0 = 50;
% input2.y0 = 50;
% input2.teta0 = input.res.final_or;
% 
% input2.y1 = 100;
% input2.x1 = 100;
% input2.d = 1;
% 
% input2 = mobile_invers(input2);
% plot_circle_path(input2);

