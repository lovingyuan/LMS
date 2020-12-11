function [yn,W,en]=LMS(xt,dn,M,mu)
itr = length(xt);
en = zeros(itr,1);          % 误差序列,en(k)表示第k次迭代时预期输出与实际输入的误差
W  = zeros(M,itr);% 每一行代表一个加权参量,每一列代表-次迭代,初始为0
% 迭代计算
 
for k = M:itr                % 第k次迭代
    x = xt(k:-1:k-M+1) ;     % 滤波器M个抽头的输入
    y = W(:,k-1).' * x ;       % 滤波器的输出
    en(k) = dn(k) - y  ;      % 第k次迭代的误差
    % 滤波器权值计算的迭代式
    W(:,k) = W(:,k-1) + 2*mu*en(k)*x;
end
 
% 求最优时滤波器的输出序列  r如果没有yn返回参数可以不要下面的
yn = inf * ones(size(xt)) ;% inf 是无穷大的意思
for k = M:length(xt)
    x = xt(k:-1:k-M+1);
    yn(k) = W(:,end).'* x;%用最后得到的最佳估计得到输出
end
 
end
