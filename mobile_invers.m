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


syms xp yp rr mmm
eqn1 = (xp - x0)^2 + (yp -y0)^2 == (rr)^2; 
eqn2 = (xp - x1)^2 + (yp -y1)^2 == (rr)^2; 
eqn3 = x0 + (rr * cos(teta + pi/2)) == xp;
eqn4 = rr == ((mmm + 1)/ (mmm -1));

www2 = vpasolve([eqn1 ,eqn2, eqn3 , eqn4 ] , [xp, yp , rr , mmm]  );

if(debug > 0)
     fprintf("XP  =  %f\n" , double(www2.xp)); 
     fprintf("YP  =  %f\n" , double(www2.yp)); 
     fprintf("R  =  %f\n" , double(www2.rr)); 
     fprintf("mmm  =  %f\n" , double(www2.mmm)); 
end

if length(www2.mmm) > 1 
  for i = 1:length(www2.mmm) 
     if www2.mmm(i) == 1 % means inf (direct move)
         continue
     else
        m = double(www2.mmm(i));
        R = abs(double(www2.rr(i)));
        Rx =  double(www2.xp(i));
        Ry =  double(www2.yp(i));
        break;
     end
  end
end


 W =  double(((m -1) /2 ) * 5) ; % 5 is max speed of one wheel !
 
if(debug > 0)
    fprintf("Vr = m*Vl | m = %f\n" , double(m)); 
    fprintf("R Rotaion Radius = %f [u]\n" , R);
    fprintf("center[x,y] RX= %f ,RY= %f\n" , Rx , Ry);
    fprintf("W [Omega]= %f RAD/s\n" , double(W));
end

syms z

res1 = [solve( Ry + R *sin(z) - y1 == 0 , z, 'Real', true) ] ;
res2 = [solve(  Rx + R * cos(z) - x1 == 0, z, 'Real', true)];

res = -1;
exit = -1;
for i= 1 :length(res1)
    for j= 1:length(res2)
       if((  double((res1(i)) - double(res2(j)) < 0.01) && (double(res1(i)) - double(res2(j)) >= 0) ) ||( double((res1(i)) - double(res2(j)) > - 0.01) && (double(res1(i)) - double(res2(j)) < 0) ) ) % not exactly the same {math bug!}
        res = double( res1(i));
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
    if teta  > res
        current_teta = mod(2*pi - (teta - (pi/2)) , 2*pi);
    else
        if res > pi 
            current_teta = mod(2*pi - (teta - (pi/2)) , 2*pi);
        else
            current_teta = mod((teta - (pi/2)) , 2*pi);
        end
    end
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
    input.res.final_or = double(mod((teta + abs(seconds_backward * W)), 2*pi ));
    if (abs(m) > 1 )
        Vr = -5;
        Vl = Vr / m;
    else
        Vr = -5;
        Vl = Vr * m;
    end
    input.res.vr = Vr;
    input.res.vl = Vl;
    
    input.txs    = [input.txs , x1]; % total x 's
    input.tts    = [input.tts , input.t + seconds_backward]; % total time 's
    input.ttss   = [input.ttss, seconds_backward]; % total split times
    input.tys    = [input.tys , y1 ]; % totoal y 's
    input.vls    = [input.vls , Vl]; % total vl 's
    input.vrs    = [input.vrs , Vr]; % total vr 's
    input.sts    = [input.sts , "CIRCULAR MOVE ! -Back"]; % total comment 's about movement
    input.t = input.t + seconds_backward;
    
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
    input.res.final_or = double( mod((teta -  abs(seconds_fw * W)), 2*pi ));
    if (abs(m) > 1 )
        Vr = 5;
        Vl = Vr / m;
    else
        Vr = 5;
        Vl = Vr * m;
    end
    input.res.vr = Vr;
    input.res.vl = Vl;
    
    input.txs    = [input.txs , x1]; % total x 's
    input.tts    = [input.tts , input.t + seconds_fw]; % total time 's
    input.ttss   = [input.ttss, seconds_fw]; % total split times
    input.tys    = [input.tys , y1 ]; % totoal y 's
    input.vls    = [input.vls , Vl]; % total vl 's
    input.vrs    = [input.vrs , Vr]; % total vr 's
    input.sts    = [input.sts , "CIRCULAR MOVE !"]; % total comment 's about movement
    input.t = input.t + seconds_fw;
    
    if(debug > 0)
        fprintf("Current teta < last_teta \n");
        fprintf("Going forward is Faster \n");
        fprintf("%f sec forward \n" , seconds_fw);
        fprintf("VR= %fU/s VL= %fU/s \n" , Vr ,Vl );
    end
end




end

