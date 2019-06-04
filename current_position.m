function index = current_position (x , y , data)
x = x/data.d ; % Up ramge x
y = y/data.d; % up range y
alpha = data.alpha / data.d; % uprange alpha
index = x * alpha + y;
end