function [ input ] = mobile_invers( input )
%this will solv mobile robot!
% Startign detail of Robot
x0 = input.x0;
y0 = input.y0;
teta = input.teta0;

% Last XY {goal}
x1 = input.x1;
y1 = input.y1;

% WRITE TO CONSOLE ? [You know!]
debug = input.d;


syms m
eqn = (x1 - (x0 + ((m+1)/(m-1)) * cos(teta + pi/2)))^2 + (y1 - (x0 + ((m+1)/(m-1)) * sin(teta + pi/2)))^2 == ((m+1)/(m-1))^2;
www = vpasolve(eqn , m );

%fprintf("m : %f \n" , www);


for i = 1:length(www) %there whould be two m's {that one is correct} - NON VALID OTHER
    %disp("index = " + i)
    local_m = double( www(i));
    if (double( www(i)) == 1)
       continue; 
    end
    
    R =   abs( double((local_m + 1)/(local_m-1))); % R is never negative! [its distance]
    Rx =  double( x0 + ((local_m+1)/(local_m-1)) * cos(teta + pi/2));
    Ry =  double( x0 + ((local_m+1)/(local_m-1)) * sin(teta + pi/2));
    Rx2 = double( x0 - ((local_m+1)/(local_m-1)) * cos(teta + pi/2));
    Ry2 = double( x0 - ((local_m+1)/(local_m-1)) * sin(teta + pi/2));
    
    
    
    if( ( (((x1 - Rx) ^2) + ((y1 - Ry)^2) - (R^2))  < 0.01) && (((x0 - Rx) ^2 + (y0 - Ry) ^2 - (R^2)) < 0.01) ) 
        %disp("EQUATION WAS TRUE FOR " + i);
        %m = www(i);
        m = double(www(i));
    elseif (((((x1 - Rx2) ^2) + ((y1 - Ry2)^2) - (R^2))  < 0.01) && (((x0 - Rx2) ^2 + (y0 - Ry2) ^2 - (R^2)) < 0.01))
            m = double(www(i));
            Rx = Rx2; %correct ones are these
            Ry = Ry2; %correct ones are these
    end
end

%  R = (m + 1)/(m-1);
%  Rx =  x0 + ((m+1)/(m-1)) * cos(teta + pi/2);
%  Ry =  x0 + ((m+1)/(m-1)) * sin(teta + pi/2);

 W = (m -1) /2;
 
if(debug > 0)
    fprintf("Vr = m*Vl | m = %f\n" , m); 
    fprintf("R Rotaion Radius = %f [u]\n" , R);
    fprintf("center[x,y] RX= %f ,RY= %f\n" , Rx , Ry);
    fprintf("W [Omega]= %f RAD/s\n" , W);
end

syms z
eqn1 = Ry + R * sin (z) == y1;
eqn2 = Rx + R * cos (z) == x1;
eqn3 = Ry2 + R * sin (z) == y1;
eqn4 = Rx2 + R * cos (z) == x1;

res1 = [solve( Ry + R *sin(z) - y1 == 0 , z, 'Real', true)  solve( Ry2 + R *sin(z) - y1 == 0 , z, 'Real', true)] ;
% res1
res2 = [solve(  Rx + R * cos(z) - x1 == 0, z, 'Real', true)  solve( Rx2 + R * cos(z) - x1 == 0, z, 'Real', true) ];
% res2
res = -1;
exit = -1;
for i= 1 :length(res1)
%     res1(i)
    for j= 1:length(res2)
%         res2(j)
       if(( (res1(i) - res2(j) < 0.01) && (res1(i) - res2(j) >= 0) ) ||( (res1(i) - res2(j) > - 0.01) && (res1(i) - res2(j) < 0) ) ) % not exactly the same {math bug!}
        res = res1(i);
        exit = 1;
        break; 
       end
       if exit > 0 
          break; 
       end
    end
end


res = mod(res , 2 * pi);

if(debug > 0)
    fprintf("res_finale : %f \n" , res);
end


if(W >= 0) 
   current_teta = mod(teta - (pi/2) , 2*pi);
else
    current_teta = mod(teta + (pi/2) , 2*pi);
end



if(debug > 0)
    fprintf("CURRENT ROBOT TETA : %f \n" , current_teta);
    fprintf("teta_difrence : %f \n" , current_teta - res);
end

%input.result.time_taken = seconds_backward;
input.res.r = R;
input.res.rx = Rx;
input.res.ry = Ry;



% ONLY GOD KNOW
delta_teta = 0;
user_resvers = 0;
if(double(current_teta) < double(res) && W > 0) % res is Ahed [direct calculation allowed] R is On LEFT
    if(debug > 0)
        fprintf("TARGET ON LEFT {FORWARD}  \n");
    end
    delta_teta = double(res) - double(current_teta);
    if(double(res) - double(current_teta) > pi)
        user_resvers = 1;
    else
        user_resvers = 0;
    end
elseif (double(current_teta) < double(res) && W < 0)% res is BACK!!! R is On Right not left!
    if(debug > 0)
        fprintf("TARGET ON RIGHT {BACKWARD}  \n");
    end
    delta_teta = double(res) - double(current_teta);
    if(double(res) - double(current_teta) > pi)
        user_resvers = 0;
    else
        user_resvers = 1;
    end
elseif (double(current_teta) > double(res) && W < 0)% res is Ahead R is On Right not left!
    if(debug > 0)
        fprintf("TARGET ON RIGHT {FORWARD}  \n");
    end
    temp_res = double(res) + 2*pi; % now should be ahead! 
    delta_teta = mod(temp_res -current_teta  , 2*pi);
    if(delta_teta  > pi)
        user_resvers = 0;
    else
        user_resvers = 1;
    end
elseif (double(current_teta) > double(res) && W > 0)% cant use direct calculation [ revrsical! ] R is On LEFT
    if(debug > 0)
        fprintf("TARGET ON LEFT {BACKWARD}  \n");
    end
     temp_res = double(res) + 2*pi; % now should be ahead! 
    delta_teta = mod(temp_res -current_teta  , 2*pi);
    if(delta_teta  > pi)
        user_resvers = 1;
    else
        user_resvers = 0;
    end
    
    
    
    
end



if (user_resvers > 0)
    %delta = current_teta - res;
    seconds_backward =  abs(delta_teta / W);
    input.res.w = -1*W;
    input.res.current_teta = current_teta;
    input.res.finale_teta = res;
    input.res.final_or = double(mod((teta - abs(seconds_backward * W)), 2*pi ));
    if (abs(m) > 1 )
        Vr = -5;
        Vl = Vr / m;
    else
        Vr = -5;
        Vl = Vr * m;
    end
    input.res.vr = Vr;
    input.res.vl = Vl;
    
    if(debug > 0)
        fprintf("Current teta > lasr_teta \n");
        fprintf("Going back ward is faster \n");
        fprintf("%f sec back \n" , seconds_backward);
        fprintf("VR= %fU/s VL= %fU/s \n" , Vr ,Vl );
    end
else
    %delta = res - current_teta;
    seconds_fw =  abs(delta_teta / W);
    input.res.w = W;
    input.res.current_teta = current_teta;
    input.res.finale_teta = res;
    input.res.final_or = double( mod((teta +  abs(seconds_fw * W)), 2*pi ));
    if (abs(m) > 1 )
        Vr = 5;
        Vl = Vr / m;
    else
        Vr = 5;
        Vl = Vr * m;
    end
    input.res.vr = Vr;
    input.res.vl = Vl;
    
    if(debug > 0)
        fprintf("Current teta < last_teta \n");
        fprintf("Going forward is Faster \n");
        fprintf("%f sec forward \n" , seconds_fw);
        fprintf("VR= %fU/s VL= %fU/s \n" , Vr ,Vl );
    end
end




end

