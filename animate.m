function res = animate(res)
[m , n] = size(res.prop.times);
goals = res.goals;
pathx = zeros(1, n);
pathy = zeros(1, n);
figure();

for i=1:1:n
    %clf; % clear figure
   
    pause(0.001);
    
    %java.lang
    
    clf('reset');
    
    res.time = res.prop.times(1,i);
    title(['time: ' num2str(res.time) 'sec' ]);
    
    %res.time = int32(res.time);
    res.time = res.time - mod (res.time , 1);
    %disp(res.time);
    
    k = res.time / 15;
    k = k - mod (k , 1); % for removing 1.000231
    k = k+1; % for indexing from 1
    %k
    
    res = draw_obs(res); % just buils the map !! show goals in animator!
    %disp(k);
    
    if goals(1 , k).g1 == 100
         hold on;
         circle (10,90,5,0,0); % g1
    
        
    end
    
    if goals(1 , k).g2 == 100
         hold on;
         circle (90,90,5,0,0); % g2
    
        
    end
    
    
    
    
    
    x = res.prop.pos_xs(1,i);
    y = res.prop.pos_ys(1,i);
    or = res.prop.pos_ors(1,i);
    
    pathx(1,i) = x;
    pathy(1,i) = y;
     
    hold on;
    circle (x,y,1,1,or); % g1
    hold on;
    plot(pathx , pathy , 'r.');
    
    
    hold on;
    plot(res.txs , res.tys , 'b.');
    hold off;
    
    
    
    %pause(1000);
    
end




end

