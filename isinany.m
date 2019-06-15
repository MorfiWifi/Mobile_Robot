function out = isinany(x , y , t )
% t = time nothing else
% adding border for Robot Radios
border = 1; % robot r = 1 
count = t/5; % time step is 5 !!!
count = count - mod (count , 1);
%count = int32(count); %% its spare not continues

%disp(int2str(count));
out = 0;

if(x >= (45- (border)) && x <= (55+ (border)))
    %disp('in 1 1');
    if((y <= 100) &&( y >= (85- (count * 2.5) - (border)) ) )
        %disp('in 1 2');
        out = 3;
    end
end

if(x >= 0 && x <=( 40 + (count * 2.5)+ (border) )  )
    %disp('in 2 1');
    if(y >= (30- (border)) && y <= (35+ (border)))
        %disp('in 2 2');
        out = 2;
    end
end

if(x >= (80 - (count * 2.5)- (border)) && x <= 100)
    %disp('in 3 1');
    if( (y >= (25- (border)) ) && (y <=(35 + (border)) ) )
        %disp('in 3 2');
        out = 1;
    end
end

if (x >= 100)
   out = 1; 
end

if ( y >= 100 )
   out = 3; 
end
end