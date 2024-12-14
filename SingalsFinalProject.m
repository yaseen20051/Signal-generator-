
%% question one 


% Time vector
t = -5:0.01:5;
% Define the unit step functions
u_t_plus_1 = t>=-1; % u(t+1)
u_t_minus_3 = t>=3; % u(t-3)
y_t = exp(-abs(t)/5) .* (u_t_plus_1-u_t_minus_3);
%  Defien y1(t)
t1_shifted = 3*t;
u_t1_plus_1_shifted = t1_shifted>=-1;
u_t1_minus_3_shifted  = t1_shifted>=3;
y1 =  exp(-abs(t1_shifted)/5) .* (u_t1_plus_1_shifted-u_t1_minus_3_shifted);
%  Defien y2(t)
t2_shifted = t+2;
u_t2_plus_1_shifted = t2_shifted>=-1;
u_t2_minus_3_shifted  = t2_shifted>=3;
y2 =  exp(-abs(t2_shifted)/5) .* (u_t2_plus_1_shifted-u_t2_minus_3_shifted);
%  Defien y3(t)
t3_shifted = 4-(2*t);
u_t3_plus_1_shifted = t3_shifted>=-1;
u_t3_minus_3_shifted  = t3_shifted>=3;
y3 =  exp(-abs(t3_shifted)/5) .* (u_t3_plus_1_shifted-u_t3_minus_3_shifted);
%%plot y(t)
figure;
subplot(2,2,1);
plot(t,y_t);
xlabel('t');
ylabel('y(t)');
title("y(t)")
grid on
%% plot y1(t)
subplot(2,2,2);
plot(t,y1);
title("y1(t)")
xlabel('t');
ylabel('y_1(t)');
title('Signal y_1(t) = y(3t)');
grid on 
%% plot y2(t)
subplot(2,2,3);
plot(t,y2);
title("y2(t)")
xlabel('t');
ylabel('y_2(t)');
title('Signal y_2(t) = y(t+2)');
grid on 
%% plot y3(t)
subplot(2,2,4);
plot(t,y3);
title("y3(t)")
xlabel('t');
ylabel('y_3(t)');
title('Signal y_3(t) = y(4-2t)');
grid on 


