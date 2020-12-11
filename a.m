close  all
% �����źŵĲ��� 
t=0:999;
xs=5*square(0.03*t,50);
figure;
subplot(2,1,1);
plot(t,xs);grid;
ylabel('��ֵ');
title('{�����������ź�}');
 
% �����źŵĲ���
t=0:999;
xn=randn(1,1000);
subplot(2,1,2);
plot(t,xn);grid;
ylabel('��ֵ');
xlabel('ʱ��');
title('{�������ź�}');
 
% �ź��˲�
xt = xs+xn;
xt = xt.';   % �����ź�����
dn = xn.' ;   % Ԥ�ڽ������
M  = 20 ;   % �˲����Ľ���
rho_max = max(eig(xt*xt.'));  % �����ź���ؾ�����������ֵ
mu = (1/rho_max)     % �������� 0 < mu < 1/rho
 
 
 
 
 
[yn,W,en] = LMS(xt,dn,M,mu);
Y=xt-yn;
% �����˲��������ź�
figure;
subplot(2,1,1);
plot(t,xt);grid;
ylabel('��ֵ');
xlabel('ʱ��'); 
title('{�˲��������ź�}');
 
% ��������Ӧ�˲�������ź�
subplot(2,1,2);
plot(t,yn);grid;
ylabel('��ֵ');
xlabel('ʱ��');
title('{���Ƶİ�����}');
 
% ��������Ӧ�˲�������ź�,Ԥ������źź����ߵ����
figure 
plot(t,xs,'g',t,Y,'y',t,Y-xs.','r');grid;
legend('Ԥ�����','����Ӧ�˲������','���');
ylabel('��ֵ');
xlabel('ʱ��');
title('{����Ӧ�˲���}');
