%  this thinks map has sections!!
%  **********************
%  *  E     *****  F    *
%  *		*****		*
%  *					*
%  ******  D		*****
%  ******           *****
%  *					*
%  *	A      B	 C	*
%  *					*
%  **********************

function [ input ] = get_section ( input )
t = input.t;
x = input.x;
y = input.y;

border = 1; % robot r = 1 
count = t/10;
count = count - mod (count , 1);

input.x = x;
input.y = y;
input.t = t;
input.section = "N"; %not determined section


res1 = isinany( x, y ,t);

if res1 ~= 0 
   %alredy in obstecoll -- cant do any thing! 
   input.can_go_on  = 0;
   input.section = "N";
else
    input.can_go_on  = 1; % you can go on ....
    if ( 0 < x && x <=( 40 + (count * 2.5)+ (border) )  && 0<y && y <30 )
        input.section = "A";
    elseif( ( 40 + (count * 2.5)+ (border) ) <= x && x <= (80 - (count * 2.5)- (border)) && 0<y && y <30 )
        input.section = "B";
    elseif( (80 - (count * 2.5)- (border)) <= x && x < 100 && 0< y && y < 25)
        input.section = "C";
    elseif(( 40 + (count * 2.5)+ (border) ) <x && x <= (80 - (count * 2.5)- (border)) &&  25 <= y && y <= (85- (count * 2.5) - (border))  )
        input.section = "D";
    elseif(0<x && x < 40 && 35 < y && y < 100)
        input.section = "E";
    elseif(55<x && x < 100 && 35 < y && y < 100)
        input.section = "F";
    else
        input.section = "N";
    end
end



end

