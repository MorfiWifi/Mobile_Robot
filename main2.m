%% section one
clc();
l = 2; % distance between wheels
Vr = 4;
Vl = 5;
W = Vr - Vl / l;
R = (l/2) * ((Vr + Vl) /(Vr - Vl));

disp(R)

%% section 2 cicuits!
X0 = 0;
Y0 = 0;
X1 = 5;
Y1 = 6;
dist = (X0 - X1) * (X0 - X1)  + (Y1 - Y0) * (Y1 - Y0);
disp (dist);

hit_r = dist/2 + dist /4 ; % to calcultae cicuit
h = sqrt( (hit_r * hit_r) - ((dist/2)*(dist/2)));
disp("h : " + h);

% hit_r = R is reverse !

ICC = [X0 - R*sin(0) , Y0 + R * cos(0)];
teta_end = 0;
end_point =  [X1 ,Y1 , teta_end ];


end_point  - [ICC(1,1) , ICC(1 ,2) , ]

%% check invers 
clc();
    params.x  = 0; % firs possitions
    params.y = 0;
    y = 0;
    t = 5 ; % time spent in!! (Should be calculated !!!)
    vr =4 ;
    vl =5 ;
    x_icc = 0;
    y_icc = 0;
    R = 0; % Rotation  r
    r = 0; % wheel r
    w = 0 ;
    l = 2 ; % wheel distance
    teta = 0; % init Teta
    
     %((vl + vr)/(vr - vl))*(l/2);
    R = 10;  % calculated
    w = (vr - vl) / l;
    x_icc = params.x  - R*sin(teta);
    y_icc = params.y + R*cos(teta);
    tota = w*t;
    
    
answer = [5;5;0]; 
answer =  answer - [x_icc ; y_icc ; (tota)];
answer = answer / [x_icc ; y_icc ; (tota)];
disp(answer + "");

% answer = [cos(tota) -sin(tota) 0 ; sin(tota) cos(tota) 0 ; 0 0 1]...
%             * [params.x - x_icc ; params.y - y_icc ; teta ] + [x_icc ; y_icc ; (tota)];
%         params.x  = answer (1 , 1);
%         y = answer (2 , 1);
%         teta_end = answer(3 ,1);
%         disp("ANSWER : " + answer);

%%

 % Normal Calculates
 clc();
    params.x  = 0; % firs possitions
    params.y = 0;
    y = 0;
    t = 5 ; % time spent in!! (Should be calculated !!!)
    vr =4 ;
    vl =5 ;
    x_icc = 0;
    y_icc = 0;
    R = 0; % Rotation  r
    r = 0; % wheel r
    w = 0 ;
    l = 2 ; % wheel distance
    teta = 0; % init Teta

    
    %((vl + vr)/(vr - vl))*(l/2);
    R = 10; 
    w = (vr - vl) / l;
    x_icc = params.x  - R*sin(teta);
    y_icc = params.y + R*cos(teta);
    tota = w*t;
    
    if(R == inf)
        disp('No Rotation !')
        R = 0;
        params.x  =  params.x  + (vr*t) * cos(teta);
        params.y = params.y + (vr*t) * sin(teta);
        teta_end = teta;
    else
        answer = [cos(tota) -sin(tota) 0 ; sin(tota) cos(tota) 0 ; 0 0 1]...
            * [params.x - x_icc ; params.y - y_icc ; teta ] + [x_icc ; y_icc ; (tota)];
        params.x  = answer (1 , 1);
        y = answer (2 , 1);
        teta_end = answer(3 ,1);
        disp("ANSWER : " + answer);
        %disp(num2str(rad_deg(teta_end)));
    end

   %% EQUATION
   clc();
   myEqn = sym('c = (1/(tm-60))*(tm*exp(-t/tm)-60*exp(-t/60))');
   newEqn = subs(myEqn,{'t','c'}, [5,45]);
   ans = solve(newEqn);
   disp(ans);
   
   %%
   syms a b c x
eqn = a*x^2 + b*x + c == 0;
solx = solve(eqn, x)
%%
clc();
   
X0 = 0;
Y0 = 0;
X1 = 2;
Y1 = 2;
dist = sqrt((X0 - X1) * (X0 - X1)  + (Y1 - Y0) * (Y1 - Y0));
disp ( "Direct distance : " + dist);

hit_r = dist/2 + dist /4 ; % to calcultae cicuit
h = sqrt( (hit_r * hit_r) - ((dist/2)*(dist/2)));
disp("h : [not used] " + h);
disp("R {round radius} : " + hit_r);


   syms t
   %r= 56;
   x=  2;
   y = 2;
eqn = ((x + h* cos(t))^2) + ((y + h* sin(t) )^2)  == hit_r^2;
wt = vpasolve(eqn, t );

fprintf("W * T :  %f \n" , wt); 
% disp( "THE W * T : " + wt);


params.x  = 0; % firs possitions
    params.y = 0;
    y = 0;
    %t = 5 ; % time spent in!! (Should be calculated !!!)
   % vr =4 ;
 %   vl =5 ;
%     x_icc = 0;
%     y_icc = 0;
    %R = 0; % Rotation  r
    r = 0; % wheel r
    w = 0 ;
    l = 2 ; % wheel distance
    teta = 0; % init Teta

    
    %((vl + vr)/(vr - vl))*(l/2);
    R = 10; 
    %w = (vr - vl) / l;
    x_icc = params.x  - R*sin(teta);
    y_icc = params.y + R*cos(teta);
    tota = wt; 
    %w*t;
    
    
answer = [cos(tota) -sin(tota) 0 ; sin(tota) cos(tota) 0 ; 0 0 1]...
            * [params.x - x_icc ; params.y - y_icc ; teta ] + [x_icc ; y_icc ; (tota)];
        params.x  = answer (1 , 1);
        y = answer (2 , 1);
        teta_end = answer(3 ,1);
        disp("ANSWER : " + answer);

syms vvr vvl
w = wt;
eqn = (vvr - vvl )/ 2  == w;
www = vpasolve(eqn, [vvr  vvl] );

fprintf("VVR : %f \n" , www.vvr);
fprintf("VVL : %f \n" , www.vvl);
%disp("WOW : " + www);

%%
x0 = 0;
y0 = 0;
teta = 0;

x1 = -100;
y1 = 500;


% 
% rx = x0 + ((m+1)/(m-1)) * cos(teta + pi/2);
% ry = x0 + ((m+1)/(m-1)) * sin(teta + pi/2);

syms m
eqn = (x1 - (x0 + ((m+1)/(m-1)) * cos(teta + pi/2)))^2 + (y1 - (x0 + ((m+1)/(m-1)) * sin(teta + pi/2)))^2 == ((m+1)/(m-1))^2;
www = vpasolve(eqn , m );

fprintf("m : %f \n" , www);
fprintf("m : %f \n" , www);

%%
for i = 1:length(www) %there whould be two m's {that one is correct} - NON VALID OTHER
    disp("index = " + i)
    m = www(i);
    R = (m + 1)/(m-1);
    Rx = x0 + ((m+1)/(m-1)) * cos(teta + pi/2);
    Ry = x0 + ((m+1)/(m-1)) * sin(teta + pi/2);
    if( ( (((x1 - Rx) ^2) + ((y1 - Ry)^2) - (R^2))  < 1) && (((x0 - Rx) ^2 + (y0 - Ry) ^2 - (R^2)) < 1)) 
        disp("EQUATION WAS TRUE FOR " + i);
        m = www(i);
    end
end

clc
 %m = www(1,1);
 R = (m + 1)/(m-1);
 Rx = x0 + ((m+1)/(m-1)) * cos(teta + pi/2);
 Ry = x0 + ((m+1)/(m-1)) * sin(teta + pi/2);
 W = m -1 /2;
fprintf("R : %f \n" , R);
fprintf("RX : %f \n" , Rx);
fprintf("RY : %f \n" , Ry);
fprintf("W : %f \n" , W);



circle(Rx,Ry,R,0, teta);
hold on
plot(x0 , y0 , 'b*');
plot(x1 , y1 , 'r*');
plot(Rx , Ry , 'g*');
hold off

syms z
eqn1 = Ry + R * sin (z) == y1;
eqn2 = Rx + R * cos (z) == x1;

res1 = solve( Ry + R *sin(z) - y1 == 0 , z, 'Real', true);
res2 = solve(  Rx + R * cos(z) - x1 == 0, z, 'Real', true);
res = -1;
exit = -1;
for i= 1 :length(res1)
    for j= 1:length(res2)
       if((res1(i) - res2(j) < 0.01 && res1(i) - res2(j) > 0) ||(res1(i) - res2(j) > - 0.01 && res1(i) - res2(j) < 0)  ) % not exactly the same {math bug!}
        res = res1(i);
        exit = 1;
        break;
       end
       if exit > 0 
          break; 
       end
    end
end

%fprintf("TETAS1 : %f \n" , res1);
%fprintf("TETAS2 : %f \n" , res2);
res = mod(res , 2 * pi);
fprintf("res_finale : %f \n" , res);
current_teta = mod(teta - (pi/2) , 2*pi);
fprintf("CURRENT ROBOT TETA : %f \n" , current_teta);
fprintf("teta_difrence : %f \n" , current_teta - res);



if (double(current_teta) > double(res))
    fprintf("Current teta > lasr_teta \n");
    fprintf("Going back ward is faster \n");
    delta = current_teta - res;
    seconds_backward =  delta / W;
    fprintf("%f sec back \n" , seconds_backward);
    if (abs(m) > 1 )
        Vr = -5;
        Vl = Vr / m;
    else
        Vr = -5;
        Vl = Vr * m;
    end
    fprintf("VR= %fU/s VL= %fU/s \n" , Vr ,Vl );
else
    fprintf("Current teta < last_teta \n");
    fprintf("Going forward is Faster \n");
    delta = res - current_teta;
    seconds_fw =  delta / W;
    fprintf("%f sec forward \n" , seconds_fw);
    Vr = 5;
    Vl = Vr * m;
    fprintf("VR= %fU/s VL= %fU/s \n" , Vr ,Vl );
end

%% Using Results OF INStrumenst
clc();
close();
disp("GOD DOSE'T EXIST");
input.x0 = 0;
input.y0 = 0;
input.teta0 = 0;

input.y1 = 50;
input.x1 = 50;

input.d = 1;
input.time = 0;
input = draw_obs(input);

input = mobile_invers(input);
plot_circle_path(input);

input2.x0 = 50;
input2.y0 = 50;
input2.teta0 = input.res.final_or;

input2.y1 = 100;
input2.x1 = 100;
input2.d = 1;

input2 = mobile_invers(input2);
plot_circle_path(input2);

