function data = build_gols(data)
%array = zeros(1,10);
array(1,1).g1 = 100;
array(1,1).g1x = 10;
array(1,1).g1y = 90;

array(1,1).g2 = 0;
array(1,1).g2x = 90;
array(1,1).g2y = 90;



for i=2:1:10
    m = rand(1,1);
    n = rand(1,1);
    
    if m >= 0.5
        array(1,i).g1 = 100;
        array(1,i).g1x = 10;
        array(1,i).g1y = 90;
    else
        array(1,i).g1 = 0;
        array(1,i).g1x = 10;
        array(1,i).g1y = 90;
    end
        
    if n >= 0.5
        array(1,i).g2 = 100;
        array(1,i).g2x = 90;
        array(1,i).g2y = 90;
    else
        array(1,i).g2 = 0;
        array(1,i).g2x = 90;
        array(1,i).g2y = 90;
    end
    
    
    
    
end

data.goals = array;


end

