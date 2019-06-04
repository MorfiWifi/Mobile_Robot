function section_data = print_func(res,section_data)
distance = section_data.dist; % distance that moved!!


if section_data.rot == 0
             %just straight
            section_data.or0 = section_data.or;
            section_data.time = section_data.time + ((distance ) / section_data.speed);
            if section_data.i ==  section_data.count
                
                if section_data.pr == 1
                    disp(['t: ' num2str(section_data.pre_time) 's -t: ' num2str(section_data.time) 's or: ' num2str(section_data.or0) ' deg VL: 10 VR: 10 x: ' num2str(section_data.x) ' y: ' num2str(section_data.y)]);
            
                end
            end
 else
             % firs rot then straight
             if section_data.pr == 1
                disp(['t: ' num2str(section_data.pre_time) 's -t: ' num2str(section_data.time) 's or: ' num2str(section_data.or0) ' deg VL: 10 VR: 10 x: ' num2str(section_data.x) ' y: ' num2str(section_data.y)]);
            end
            section_data.st_time = section_data.time;
            section_data.time = section_data.time + abs(section_data.rot) * section_data.rot_scal;
            if section_data.pr == 1
                sun_str = '';
                if section_data.or > 0
                    sun_str = 'VL: -10 VR: +10';
                else
                    sun_str = 'VL: +10 VR: -10';
                end
                disp(['t: ' num2str(section_data.st_time) 's -t: ' num2str(section_data.time) 's rotated ' num2str(section_data.rot) ' deg ' 'ori ' num2str(section_data.or) ' deg ' sun_str ' x: ' num2str(section_data.x) ' y: ' num2str(section_data.y) ]);
            end
            section_data.pre_time = section_data.time; % before straight going
            section_data.time = section_data.time + ((distance ) / section_data.speed); 
            section_data.or0 = section_data.or;
end
         
end

