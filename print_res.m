function [ data ] = print_res ( data )
[m , n] = size(data.txs);
for i =1 : n
    disp(  "X: "+data.txs(i) + " , " + "Y: "+data.tys(i) + "VR : " + data.vrs(i) + "VL :" + data.vls(i) + "took : " + data.ttss(i) + " COMMENT : " + data.sts(i)  );
end

