function out = isborder(x , y , t )

count = t/5; % time step is 5 !!!
count = count - mod (count , 1);

out = 0;

if((x == 45) || (x == 55))
    %disp('in 3 1');
    if( y >= (85- (count * 2.5)))
        %disp('in 3 2');
        out = 3;
    end
end




if((x >= 45) && (x <= 55))
    %disp('in 3 1');
    if( y == (85- (count * 2.5)))
        %disp('in 3 2');
        out = 3;
    end
end





% 0 = 50,12,5 sh 1
if(x >= 0 &&  x <= ( 40 + (count * 2.5) ) )
    %disp('in 2 1');
    if((y == 30) ||  (y == 35))
        %disp('in 2 2');
        out = 2;
    end
end

if( x == ( 40 + (count * 2.5) ) )
    %disp('in 2 1');
    if(y >= 30 &&  y <= 35)
        %disp('in 2 2');
        out = 2;
    end
end


% 0 = 50,12,5 sh 1
if((x >= ( 80 - (count * 2.5) )) &&  (x <= 100)  )
    %disp('in 1 1');
    if((y == 25) ||  (y == 35))
        %disp('in 1 2');
        out = 1;
    end
end



if( x == ( 80 - (count * 2.5) ) )
    %disp('in 1 1');
    if((y >= 25) &&  (y <= 35) )
        %disp('in 1 2');
        out = 1;
    end
end






end