%% tt1
clc;
data.teta = 0;  % degree x way !

plot_path_NF = 0;% want the path!

%mmm = build_graph (1);
%m = isinany(10.01 , 12.025 , 51);

data.plot = 0; % show The grapg build res
data.density = 1;% Dont Ever Plot on small Density

% Robot -propertyes
data.lmaxspeed = 5; % Lmax
data.rmaxspeed = 5; % Rmax
data.firstteta = 0; % teta0
data.l = 2; % weel distance radios = 1
data.x = 0; % dosent relly mater
data.y = 0; % dosent relly mater
params.onlyrotate_speed = 0; % calc just max speed ...
data.time = 0;
data.is_first = 1;



data.add_to_path = 0;

data.sx = 98; % start possition
data.sy = 2;                 

data.ex = 10; % end possition
data.ey = 90;


% build graph 
res = B_G(data); 

%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GOAL PART
%res = my_goal(res);
res = build_gols(res); % we already have goods!
%res = perint_goals(res); % print res!
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GOAL PART


res.obs = 1; % draw obstackles
res.fill_obs = 0;
res.time = 0; % current Time for draw

res = plot_path (res);
res = path_to_xy(res); % now we have xs , ys in data

close all;
disp('part 1 finished');
fprintf("GOD DOSENT EXIS\'T\n");

res.teta = data.teta;

speed = 10; % metr/s Direct run 0.22s max taken for 1 step
%rorarion_sp = 50; % degree/s
res.onlyrotate_speed = 1;
res = mobile (res);
rot_scal = res.rot_pd;
or = data.teta;%res.teta; % orentation Teta 0!!
total_time = 0;
time_di = 0;
time = 0;
pre_time = 0;

interval_min = 14.8;
interval_max = 29;

section_data.or0 = data.teta ;%res.teta; % This is teta0 BE WARE!!
section_data.speed = speed;
section_data.pre_time = pre_time;
section_data.time = time;
section_data.total_time = total_time;
section_data.rot_scal = rot_scal;
section_data.pr = 0; % Dont Print in This Section!! Foture Print...!
res.wait_here = 0;
res.est_goal = 1;

teta0 =res.teta; % orientation !
[mm , count]= size(res.xs);
count = ( count -1); % count = 96 for d = 1;
section_data.count = count;
for i=1 : 1 :  count
    res.i = i;
    x = res.xs(1,i);
    y = res.ys(1 ,i);
    deltax = res.xs(1,i+1) - x;
    deltay = res.ys(1 ,i+1) - y;

    deltax = deltax/res.d; % For making SCALER!
    deltay = deltay/res.d;

    string = [num2str(deltax)  num2str(deltay)]; 
    %disp(string);

    section_data.i = i;

if (section_data.time < interval_max) && (section_data.time > interval_min)
    %hold on;
    %plot(res.xs(1,i) , res.ys(1,i) , 'g*');
    %disp('in interval >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'); % abit risky!
    
    if res.goals(1,2).g1 == 100
        %disp('in interval >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Goal is here !!');
        % finish your job like its NOTHING MATTER!!
        %interval_min = inf;
        
        res.wait_here = 0; % You got that!!
        res.est_goal = 1;
        res.wait_here = 1;
        res.x = x;
        res.y = y;
        res = is_in_goal(res,1);
        
        %disp(res.is_goal);
        if res.is_goal <= 0
            disp('1 is goal in continue');
            res.last_index = i;
            break;
        end
        
        
        % You Are Already there!
    elseif res.goals(1,2).g2 == 100
        %chainge your destination (its benefetial !)
        % case of interest!!! all of suden the idea!
        %disp('in interval >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> FIND CONTINUE PATH');
            res.sx = x; % start possition
            res.sy = y;
            res.add_to_path = 1;
            res.est_goal = 2;

            %disp(num2str(res.goals(1,2).g2x));
            res.ex = res.goals(1,2).g2x; % end possition
            res.ey = res.goals(1,2).g2y;

            res.obs = 1; % draw obstackles
            res.fill_obs = 0;
            res.time = 0; % current Time for draw just draw!!
            res = plot_path (res);
            res.wait_here = 0; % You Got that..
            
            break;
            
            
    else
    
        res.est_goal = 1;
        res.wait_here = 1;
        res.x = x;
        res.y = y;
        res = is_in_goal(res,1);
        %disp(res.is_goal);
        if res.is_goal <= 0
            %disp('getting out of hell');
            res.last_index = i;
            break;
        end
            
            
        
        
         %Finish your way and wait for time!
         % Go theres and Wait GOD HEPS YOU !
         
        
            
    
    end
    
    
    
    % build graph a gain ! wait Until 10s 
    %break;
    
end

switch string
    case '10'
         %disp('cac are Yascasou');
         % its going Right - Teta = 0
         rot = min_rot(or , 0);
         or = 0;
         
         section_data.rot = rot;
         section_data.or = or;
         section_data.dist = res.d;
         section_data = print_func(res , section_data );
         
    case '-10'
        rot = min_rot(or , 180);
        or = 180;
        
        section_data.rot = rot;
        section_data.or = or;
        section_data.dist = res.d;
        section_data = print_func(res , section_data );
        
        
    case '01'
        rot = min_rot(or , 90);
        or = 90;
        section_data.rot = rot;
        section_data.or = or;
        section_data.dist = res.d;
        section_data = print_func(res , section_data );
    case '0-1'
        rot = min_rot(or , 270);
        or = 270;
        section_data.rot = rot;
        section_data.or = or;
        section_data.dist = res.d;
        section_data = print_func(res , section_data );
    case '11'
        rot = min_rot(or , 45);
        or = 45;
        section_data.rot = rot;
        section_data.or = or;
        section_data.dist = sqrt(2) * res.d;
        section_data = print_func(res , section_data );
         %disp('saccwa are Yawcaou');
   
    case '1-1'
        rot = min_rot(or , 315);
        or = 315;
        section_data.rot = rot;
        section_data.or = or;
        section_data.dist = sqrt(2) * res.d;
        section_data = print_func(res , section_data );
    case '-11'
        rot = min_rot(or , 135);
        or = 135;
        section_data.rot = rot;
        section_data.or = or;
        section_data.dist = sqrt(2) * res.d;
        section_data = print_func(res , section_data );
    case '-1-1'
        %disp('Whow are You');
        rot =  min_rot(or , 225);
        or = 225;
        section_data.rot = rot;
        section_data.or = or;
        section_data.dist = sqrt(2) * res.d;
        section_data = print_func(res , section_data );
    case '12'
        rot = min_rot(or , 67.5);
        or = 67.5;
        section_data.rot = rot;
        section_data.or = or;
        section_data.dist = sqrt(5) * res.d;
        section_data = print_func(res , section_data );
    case '1-2'
        rot = min_rot(or , 292.5);
        or = 292.5;
        section_data.rot = rot;
        section_data.or = or;
        section_data.dist = sqrt(5) * res.d;
        section_data = print_func(res , section_data );
    case '-12'
        rot =  min_rot(or , 112.5);
        or = 112.5;
        section_data.rot = rot;
        section_data.or = or;
        section_data.dist = sqrt(5) * res.d;
        section_data = print_func(res , section_data );
    case '-1-2'
        rot = min_rot(or , 247.5);
        or = 247.5;
        section_data.rot = rot;
        section_data.or = or;
        section_data.dist = sqrt(5) * res.d;
        section_data = print_func(res , section_data );
    case '21'
        rot = min_rot(or , 22.5);
        or = 22.5;
        section_data.rot = rot;
        section_data.or = or;
        section_data.dist = sqrt(5) * res.d;
        section_data = print_func(res , section_data );
    case '2-1'
        rot = min_rot(or , 337.5);
        or = 337.5;
        section_data.rot = rot;
        section_data.or = or;
        section_data.dist = sqrt(5) * res.d;
        section_data = print_func(res , section_data );
    case '-21'
        rot = min_rot(or , 157.5);
        or = 157.5;
        section_data.rot = rot;
        section_data.or = or;
        section_data.dist = sqrt(5) * res.d;
        section_data = print_func(res , section_data );
    case '-2-1'
        rot = min_rot(or , 202.5);
        or = 202.5;
        section_data.rot = rot;
        section_data.or = or;
        section_data.dist = sqrt(5) * res.d;
        section_data = print_func(res , section_data );
        %disp('did you scare');
    otherwise
      disp('Where the hell You GO !')
end
    
    
end
res.last_index = count;

disp('part 2 finished');

res.teta = data.teta;
res = path_analyses(res);
disp('part 3 finished');

if plot_path_NF > 0
    res = path_to_xy(res);
   plot(res.xs , res.ys ,'G.');
   title('Golden Path');
   %figure;
   pause(2);
end

%% ANIMATOR
res = animate(res);
disp('part 4 animated');









