function [ input ] = get_section_detail( input )

t = input.t;
count = t/5; % time step is 5 !!!
count = count - mod (count , 1);
fix_possition = input.fix_it;
%is_fix = input.check_fix;
go_next_section = input.go_next;



% A B C D E F
% x,y,teta;x,y,teta;....
good_points = [  30,10,0 ; 50,15,pi/2 ; 80,10,pi ; 50,(85-(count*2.5) - 15),pi ; 10,90,0 ; 90,90,0 ] ;


% if fix_possition <= 0 
%     return
% end


w = (5 + 5 )/ 2; % speed of in place rotate ...
input.temps.w = w;


switch input.section 
    case "A"
        if fix_possition > 0
            input = fix_section(input , 1,good_points);
        end
        
        if go_next_section > 0
          % need circular move[a to] d---
          input.next.x =  good_points(4 , 1);
          input.next.y =  good_points(4 , 2);
        end
        
        if input.x == good_points(1 , 1) && input.y == good_points(1 , 2)
            input.is_fix = 1;
        else
            input.is_fix = 0;
        end
        
    case "B"
        if fix_possition > 0
            input = fix_section(input , 2,good_points);
        end
        
        
        if go_next_section > 0
          % moove staright then rotate ....
          % need circular move [b to] d & rotate --
          index = 4;
          dist = sqrt( ((input.x -  good_points(index ,1))^2 + (input.y - good_points(index ,2))^2));
            time_takes = dist / 5;
            
          input.txs = [input.txs , input.x];
            input.tts = [input.tts , input.t + time_takes ]; 
            input.ttss = [input.tts , time_takes];
            input.tys = [input.tys ,  input.y];
            input.vls = [input.vls ,  5 ];
            input.vrs = [input.vrs ,  5 ];
            input.sts = [input.sts , "MOVING STRAIGHT" ];
            
            rotation_time =  abs(input.teta - good_points(index ,3))/w;
            input.teta = good_points(index ,3);
            input.t = input.t + time_takes + rotation_time;
            input.x = good_points(index ,1);
            input.y = good_points(index ,2);
            
            
            input.txs = [input.txs , input.x];
            input.tts = [input.tts , input.t]; 
            input.ttss = [input.tts , rotation_time];
            input.tys = [input.tys ,  input.y];
            input.vls = [input.vls ,  -5 ];
            input.vrs = [input.vrs ,  5 ];
            input.sts = [input.sts , "ROATTING" ];
        end
        
        if input.x == good_points(2 , 1) && input.y == good_points(2 , 2)
            input.is_fix = 1;
        else
            input.is_fix = 0;
        end
    case "C"
        if fix_possition > 0
            input = fix_section(input , 3,good_points);
        end
        
        if go_next_section > 0
          % need circular move to [c to ] d---
          input.next.x =  good_points(4 , 1);
          input.next.y =  good_points(4 , 2);
        end
        
        if input.x == good_points(3, 1) && input.y == good_points(3 , 2)
            input.is_fix = 1;
        else
            input.is_fix = 0;
        end
    case "D"
        if fix_possition > 0
            input = fix_section(input , 4,good_points);
        end
        
        
        if go_next_section > 0
          % need circular move to E ||  F def E
          input.next.x =  good_points(5 , 1);
          input.next.y =  good_points(5 , 2);
        end
        
        if input.x == good_points(4 , 1) && input.y == good_points(4, 2)
            input.is_fix = 1;
        else
            input.is_fix = 0;
        end
    case "E"
        if fix_possition > 0
            input = fix_section(input , 5,good_points);
        end
        
        
        if go_next_section > 0
          % this is dead end
        end
        
        if input.x == good_points(5 , 1) && input.y == good_points(5 , 2)
            input.is_fix = 1;
        else
            input.is_fix = 0;
        end
    case "F"
        if fix_possition > 0
            input = fix_section(input , 6 ,good_points);
        end
        
         if go_next_section > 0
          % this is dead end
         end
        
         
        if input.x == good_points(6 , 1) && input.y == good_points(6 , 2)
            input.is_fix = 1;
        else
            input.is_fix = 0;
        end
        
    otherwise
        disp("What did you spect ?");
end




end

function input = fix_section (input , index , good_points)
            w = input.temps.w;
            rotation_time =  abs(input.teta - good_points(index ,3))/w;
            input.txs = [input.txs , input.x];
            input.tts = [input.tts , input.t + rotation_time]; 
            input.ttss = [input.tts , rotation_time];
            input.tys = [input.tys ,  input.y];
            input.vls = [input.vls ,  -5 ];
            input.vrs = [input.vrs ,  5 ];
            input.sts = [input.sts , "ROATTING" ];
            
            
            dist = sqrt( ((input.x -  good_points(index ,1))^2 + (input.y - good_points(index ,2))^2));
            time_takes = dist / 5;
            input.teta = good_points(index ,3);
            input.t = input.t + time_takes + rotation_time;
            input.x = good_points(index ,1);
            input.y = good_points(index ,2);
            
            
            input.txs = [input.txs , input.x];
            input.tts = [input.tts , input.t ]; 
            input.ttss = [input.tts , time_takes];
            input.tys = [input.tys ,  input.y];
            input.vls = [input.vls ,  5 ];
            input.vrs = [input.vrs ,  5 ];
            input.sts = [input.sts , "MOVING STRAIGHT" ];
end

