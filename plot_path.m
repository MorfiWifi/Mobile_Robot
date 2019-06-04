function res = plot_path(data)

if data.add_to_path == 1
    
    [rr , dots] = size(data.p); %OLD PATH DATA
    i = data.i; % current index (we are here);
    
    start_index = current_position(data.sx , data.sy , data);
    end_index = current_position(data.ex , data.ey , data);
    G = data.g;
    [p,d] = shortestpath(G , start_index , end_index ) ; % p = path , d = cost
    [d1 ,d2] = size(p);
    %d2 = (d2 + i -1);
    pos.x = zeros(1,(d2 + i -1));
    pos.y = zeros(1,(d2 + i -1));
    
    for k = 1 : 1 : i
        %xy = current_from_index (p(1,i) , data);
        pos.x(1,k) = data.xs(1,k);
        pos.y(1,k) = data.ys(1,k);
    end
    
    for k = 2 : 1 : d2
        xy = current_from_index (p(1,k) , data);
        
        index = k+i-1;
        pos.x(1,index) = xy.x;
        pos.y(1,index) = xy.y;
    end
    
    if data.obs > 0
%         hold on;
%         plot (pos.x ,pos.y , 'r.' );
%         obs = draw_obs (data);
%         plot (obs.xs , obs.ys , 'b*' );
% 
%         obs.xs;
%         obs.ys;
%         hold off;
    else
        %plot (pos.x ,pos.y , 'r.' );
    end
    
    data.xs = pos.x;
    data.ys = pos.y;
    
    res = data;
else
    
    start_index = current_position(data.sx , data.sy , data);
    end_index = current_position(data.ex , data.ey , data);
    G = data.g;
    [p,d] = shortestpath(G , start_index , end_index ) ; % p = path , d = cost
    data.p = p;
    data.totalpath = d;


    [d1 ,d2] = size(p);
    pos.x = zeros(1,d2);
    pos.y = zeros(1,d2);
    for i = 1 : 1 : d2
        xy = current_from_index (p(1,i) , data);
        pos.x(1,i) = xy.x;
        pos.y(1,i) = xy.y;
    end
    
    if data.obs > 0
        hold on;
        %plot (pos.x ,pos.y , 'r.' );
        obs = draw_obs (data);
        %plot (obs.txs , obs.tys , 'b*' );

        obs.txs;
        obs.tys;
        hold off;
    else
        %plot (pos.x ,pos.y , 'r.' );
    end

    data.xs = pos.x;
    data.ys = pos.y;

    res = data;
end



% may add ploting the obstacles
end

