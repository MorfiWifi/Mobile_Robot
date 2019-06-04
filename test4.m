disp(num2str(res.goals(1,2).g2x));

%% part 2
circle(0,0,5,0);
circle(4,4,5,0);

%% draw obs
data.time = 0;
data = draw_obs(data); % just buils the map !! show goals in animator!


 hold on
 plot(data.txs , data.tys , 'r.');
 circle (15,75,5,0,0);
 circle (75,75,5,0,0);
 circle (19.5,72.7,2,0,0);
 
 %%
 perint_goals(res);
 
 %% sadsad
% figure;
 for i=0 :1:20
     clf('reset');
     data.time = 20;
     data = draw_obs(data);
     
     plot(res.txs , res.tys , 'r.');
     %pause(0.1);

 end
 
 %% 
 
 data.time = 5;
     data = draw_obs(data);
     
     plot(data.txs , data.tys , 'r.');

     %%
     
     isborder(50,12,5);
     
     %%
     
    k = 15 / 15;
    k = k - mod (k , 1); % for removing 1.000231
    k = k+1; 
    k
    
    
    %%
    
    
    for i=1:1:30
    %clf; % clear figure
    pause(0.001);
    
    %java.lang
    
    clf('reset');
    
    res.time = res.prop.times(1,i);
    title(['time: ' num2str(res.time) 'sec' ]);
    
    res.time = int32(res.time);
    %disp(res.time);
    
    k = res.time / 15;
    k = k - mod (k , 1); % for removing 1.000231
    k = k+1; % for indexing from 1
    %k
    
    res = draw_obs(res); % just buils the map !! show goals in animator!
    %disp(k);
    
    if goals(1 , k).g1 == 100
         hold on;
         circle (15,75,5,0,0); % g1
    
        
    end
    
    if goals(1 , k).g2 == 100
         hold on;
         circle (75,75,5,0,0); % g2
    
        
    end
    
    
    
    
     
  
    
    
    %pause(1000);
    
end