%% Mobile -forward !
clc;
x = 0; % firs possitions
y = 0;
t = 2.513 ; % time spent in!! (Should be calculated !!!)
vr =10 ;
vl =0 ;
x_icc = 0;
y_icc = 0;
R = 0; % Rotation  r
r = 0; % wheel r
w = 0 ;
l = 4 ; % wheel distance
teta = 0; % init Teta

R = ((vl + vr)/(vr - vl))*(l/2);
w = (vr - vl) / l;
x_icc = x - R*sin(teta);
y_icc = y + R*cos(teta);
tota = w*t;
if(R == inf)
    disp('No Rotation !')
    R = 0;
    x =  x + (vr*t) * cos(teta);
    y = y + (vr*t) * sin(teta);
    teta_end =   rad_deg(teta);
else
    answer = [cos(tota) -sin(tota) 0 ; sin(tota) cos(tota) 0 ; 0 0 1] * [x - x_icc ; y - y_icc ; teta ] + [x_icc ; y_icc ; (w*t)];
    x = answer (1 , 1);
    y = answer (2 , 1);
    teta_end = rad_deg(answer(3 ,1));
    timeofF5 = (pi/4)/w;
    %disp(num2str(rad_deg(teta_end)));
end