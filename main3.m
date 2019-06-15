
%% fase 1
% start indexes 
% not Every thing has answer!!
close();
clc();
disp("in the Name of GOD " );
disp(" ---GOD DOSEN'T EXIST!--- ");


data.x = 10; %start x
data.y = 10; %start y
data.teta = radian(0); %strt oriantation
data.t = 0; % time

data = build_gols(data);


data = get_section(data);

data.txs    = []; % total x 's
data.tts    = []; % total time 's
data.ttss   = []; % total split times
data.tys    = []; % totoal y 's
data.vls    = []; % total vl 's
data.vrs    = []; % total vr 's
data.sts    = []; % total comment 's about movement
data.is_fix = 0;  % is this good point for circular move ? default no [auto find...]

if data.section == "N"
    disp("Current possition is not valid cant go any wthere!!");
    return
end

while data.section ~= "N"
    data.fix_it  = 1; % fix in corrent section if needed
    data.go_next = 1; % go next section 
    
    data = get_section_detail(data);
    
    if data.section == "A" || data.section == "C" || data.section == "D"
        data.x0 = data.x;
        data.y0 = data.y;
        data.teta0 =  data.teta;
        %data.t = 0;
        
        data.y1 = data.next.y;
        data.x1 = data.next.x;

        data.d = 1;
        data.time = data.t;
        data = draw_obs(data);

        data = mobile_invers(data);
        plot_circle_path(data); 
        
        % change possition with circular move ...
        data.x = data.x1;
        data.y = data.y1;
    end
    
    data = get_section(data);
    
    if data.section == "E" || data.section == "F"
        break;
    end
    
    
end

hold on
plot (data.txs , data.tys , '-k');
data = draw_obs(data);
data = print_res(data);
hold off


disp ("NOTHUNG MORE CAN BE DON ...");
disp ("Any Way the Wind blows ....");







