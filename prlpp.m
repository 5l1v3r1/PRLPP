function W = prlpp(X,k,t,zat,b,l)
%X is a d x N matrix where d is dimension of each sample and N is the
%number of samples
%k and t are two wmpirically prespecified parameters
%zat is an energy percentage, recommend 98%
%d is the dimension of each face sample
%N is the number of samples
%b is a revised eigenvalue in null space
%l is the dimension you lower the dimension of X to, l must bo lower than b
d,N = size(X);
S = zeros(N);
S = giveweight(S,N,X,k,t);
D = zeros(N);
for j = 1:N
    D(j,j) = sum(S(:,j));
end
L = D - S;
F = X*D*X';
[U,Xigma,V] = svd(F);
r = rank(Xigma);
c = givethreshold(Xigma,zat); %In theary ,c < r
[alpha,beta,a] = giveparameter(Xigma,r,c);
for i = c+1:r
    Xigma(i,i) = alpha/(i+beta)^a;
end
for i = r+1:d
    Xigma(i,i) = b;
end
F_pr = U*Xigma*V;
[V,~] = eig(inv(F_pr)*(X*L*X')); %eig默认对特征值排序了，所以无需得到特征值
W = V(:,1:l);
end