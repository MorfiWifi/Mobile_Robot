%%  Draw Path and Rotatr Circles ( Juset Define The Firs one Correctly!!)
clc;
close all
teta = 0;
%G = build_graph(1);
%[P,d] = shortestpath(G,get_xy(2, 2),get_xy(25 , 98));
 %`plot(G); figure;
%P

Res = B_G(0.5);
x = current_position(2 , 2 , Res);
y = current_position(25 , 98 , Res);
G = Res.g;
[P,d] = shortestpath(G , x , y ) ;