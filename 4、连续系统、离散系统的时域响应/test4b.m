%Q1
num = [3,20,10];
den = [1,2,5];
sys = tf(num,den);
t = 0:0.1:5;
x = sin(2*t) + cos(5*t);
sys_ss = ss(sys);
x0 = [1;2];
[y_zi ,t_zi] = initial(sys_ss,x0,t);
[y_zs, t_zs] = lsim(sys,x,t);
y_total = y_zs + y_zi;

subplot(3,1,1);
plot(t_zi,y_zi);
ylabel('y_zi');
xlabel('t');
grid on

subplot(3,1,2);
plot(t_zs,y_zs);
ylabel('y_zs');
xlabel('t');
grid on

subplot(3,1,3);
plot(t,y_total);
ylabel('y_total');
xlabel('t');
grid on

%%
%Q2
num  =[1,3];
den = [1,2,2];
sys = tf(num,den);
t = 0:0.1:10;
e = ones(size(t));
y = lsim(sys,e,t);

figure
plot(t,y)
xlabel('t');
ylabel('y');
%%
%Q3
num  =[1];
den = [1,-1,0.25];
sys = tf(num,den,1);

k = 0:49;
u = ones(1,50);
u_40 = [zeros(1,40),ones(1,10)];
impluse = zeros(1,50);
impluse(1) = 1;
e = exp(-k/7).*(u-u_40);

h = filter(num,den,impluse);
y = filter(num,den,e);

figure;
subplot(2,1,1);
stem(k,h);
xlabel('k');
ylabel('h');

subplot(2,1,2);
stem(k,y);
xlabel('k');
ylabel('y');

 
%%
%Q4
num = [1,0.2];
den = [1,-0.1];
%稳定，极点模值小于1；

k = 0:7;
x = zeros(1,length(k));
x(1) = 2;

y = filter(num,den,x);
disp(y)
figure;
stem(k,y);
grid on