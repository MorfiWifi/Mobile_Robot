function params = mobile (params)
params.time = 0;

params.y = 0;
params.x = 0;
%params.teta = 0;

if(params.onlyrotate_speed == 1)
    % Just Calculating powers!
    params.rotps =  (params.rmaxspeed + params.lmaxspeed) / params.l; % radian ps
    params.rotps_deg = rad_deg( (params.rmaxspeed + params.lmaxspeed) / params.l); % degree ps
    params.rot_pd = (1/params.rotps_deg); % time for 1dg of rot
    params.forty_five = (params.rot_pd * 45);
    params.ninety = (params.rot_pd * 90);
    params.dspeed = (params.lmaxspeed + params.rmaxspeed)/2;
else
    % Normal Calculates
    params.x  = 0; % firs possitions
    y = 0;
    t = 5 ; % time spent in!! (Should be calculated !!!)
    vr =5 ;
    vl =5 ;
    x_icc = 0;
    y_icc = 0;
    R = 0; % Rotation  r
    r = 0; % wheel r
    w = 0 ;
    l = 2 ; % wheel distance
    teta = 0; % init Teta

    R = ((vl + vr)/(vr - vl))*(l/2);
    w = (vr - vl) / l;
    x_icc = params.x  - R*sin(teta);
    y_icc = params.y + R*cos(teta);
    tota = w*t;
    
    if(R == inf)
        disp('No Rotation !')
        R = 0;
        params.x  =  params.x  + (vr*t) * cos(teta);
        params.y = params.y + (vr*t) * sin(teta);
        teta_end = teta;
    else
        answer = [cos(tota) -sin(tota) 0 ; sin(tota) cos(tota) 0 ; 0 0 1]...
            * [params.x - x_icc ; params.y - y_icc ; teta ] + [x_icc ; y_icc ; (w*t)];
        params.x  = answer (1 , 1);
        y = answer (2 , 1);
        teta_end = answer(3 ,1);
        %disp(num2str(rad_deg(teta_end)));
    end

    
    
    
    
end


%params = params;
end