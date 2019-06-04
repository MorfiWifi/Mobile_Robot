function res = perint_goals(res)
for i=1: 1 : 10
    m = (i-1)*15;
    n = i * 15;
   disp([num2str(m) '-' num2str(n)  ': g1:' num2str(res.goals(1,i).g1) ' g2:' num2str(res.goals(1,i).g2) ]); 
end
end

