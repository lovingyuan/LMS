close  all
% 周期信号的产生 
t=0:999;
xs=5*square(0.03*t,50);
figure;
subplot(2,1,1);
plot(t,xs);grid;
ylabel('幅值');
title('{输入周期性信号}');
 
% 噪声信号的产生
t=0:999;
xn=randn(1,1000);
subplot(2,1,2);
plot(t,xn);grid;
ylabel('幅值');
xlabel('时间');
title('{白噪声信号}');
 
% 信号滤波
xt = xs+xn;
xt = xt.';   % 输入信号序列
dn = xn.' ;   % 预期结果序列
M  = 20 ;   % 滤波器的阶数
rho_max = max(eig(xt*xt.'));  % 输入信号相关矩阵的最大特征值
mu = (1/rho_max)     % 收敛因子 0 < mu < 1/rho
 
 
 
 
 
[yn,W,en] = LMS(xt,dn,M,mu);
Y=xt-yn;
% 绘制滤波器输入信号
figure;
subplot(2,1,1);
plot(t,xt);grid;
ylabel('幅值');
xlabel('时间'); 
title('{滤波器输入信号}');
 
% 绘制自适应滤波器输出信号
subplot(2,1,2);
plot(t,yn);grid;
ylabel('幅值');
xlabel('时间');
title('{估计的白噪声}');
 
% 绘制自适应滤波器输出信号,预期输出信号和两者的误差
figure 
plot(t,xs,'g',t,Y,'y',t,Y-xs.','r');grid;
legend('预期输出','自适应滤波器输出','误差');
ylabel('幅值');
xlabel('时间');
title('{自适应滤波器}');
