function [yn,W,en]=LMS(xt,dn,M,mu)
itr = length(xt);
en = zeros(itr,1);          % �������,en(k)��ʾ��k�ε���ʱԤ�������ʵ����������
W  = zeros(M,itr);% ÿһ�д���һ����Ȩ����,ÿһ�д���-�ε���,��ʼΪ0
% ��������
 
for k = M:itr                % ��k�ε���
    x = xt(k:-1:k-M+1) ;     % �˲���M����ͷ������
    y = W(:,k-1).' * x ;       % �˲��������
    en(k) = dn(k) - y  ;      % ��k�ε��������
    % �˲���Ȩֵ����ĵ���ʽ
    W(:,k) = W(:,k-1) + 2*mu*en(k)*x;
end
 
% ������ʱ�˲������������  r���û��yn���ز������Բ�Ҫ�����
yn = inf * ones(size(xt)) ;% inf ����������˼
for k = M:length(xt)
    x = xt(k:-1:k-M+1);
    yn(k) = W(:,end).'* x;%�����õ�����ѹ��Ƶõ����
end
 
end
