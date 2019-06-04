function res = path_analyses(res)


speed = 10; % metr/s Direct run 0.22s max taken for 1 step
%rorarion_sp = 50; % degree/s
res.onlyrotate_speed = 1;
res = mobile (res);
rot_scal = res.rot_pd;
or = res.teta; % orentation Teta 0!!
total_time = 0;
time = 0;
pre_time = 0;





section_data.or = res.teta;
section_data.or0 = res.teta; % This is teta0 BE WARE!!
section_data.speed = speed;
section_data.pre_time = pre_time;
section_data.time = time;
section_data.total_time = total_time;
section_data.rot_scal = rot_scal;
section_data.pr = 1; %Print in This Section!! Foture Print...!



[mm , count]= size(res.xs);

if res.est_goal == 1
    count = res.last_index;
end


if (res.est_goal == 1) && (res.wait_here == 1)
    prop.times = zeros(1 , count + 1);
    prop.pos_xs = zeros(1 , count + 1);
    prop.pos_ys = zeros(1 , count + 1);
    prop.pos_ors = zeros(1 , count + 1);
else 
    prop.times = zeros(1 , count );
    prop.pos_xs = zeros(1 , count );
    prop.pos_ys = zeros(1 , count );
    prop.pos_ors = zeros(1 , count );
end

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
    section_data.x = x;
    section_data.y = y;
    section_data.i = i;
    
    
    
    prop.times(1 , i ) = section_data.time;
    prop.pos_xs(1 , i ) = x;
    prop.pos_ys(1 , i ) = y;
    prop.pos_ors(1 , i ) = section_data.or ;
    
    
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

    x = res.xs(1 ,count+1 );
    y = res.ys(1 ,count+1 );
    prop.times(1 , count+1 ) = section_data.time; % the last time is for this - x is perivios x!!!
    prop.pos_xs(1 , count+1 ) = x;
    prop.pos_ys(1 , count+1 ) = y;
    prop.pos_ors(1 , count+1 ) = section_data.or ;


if (res.est_goal == 1) && (res.wait_here == 1)
    [m , n] = size(res.goals);
    
    k = section_data.time;
    k = k - mod (k , 1);
    
    
    for i=2:1:n
       if res.goals(1,i).g1 == 100
           m = i;
           break;
       end
    end
    
    % 1 = means < 15 sec , 2 = mean < 30 sec
    if i == 2
       till_time = section_data.time;
    else
        till_time = ((m-1) * 15) + 0.0001; % For being sure
    end
    
    
    prop.times(1 , count + 2) = till_time;
    prop.pos_xs(1 , count + 2) = x;
    prop.pos_ys(1 , count + 2) = y;
    prop.pos_ors (1 , count + 2) = section_data.or ;
    
    disp(['t: ' num2str(section_data.time) 's -t: ' num2str(till_time) 's or: ' num2str(section_data.or0) ' deg VL: 0 VR: 0 x: ' num2str(x) ' y: ' num2str(y) ' waiting' ]);
end

res.prop = prop; % Results ...



end

