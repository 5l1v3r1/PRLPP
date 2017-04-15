function [alpha,beta,a] = giveparameter(Xigma,r,c)
%Xigma is d-dimension square matrix
%r is the rank of Xigma
%c is no required regularization part
Xigma_vector = Xigma*ones(d,1);
eit  = 0.05;
a0 = 1.0;
err0 = getparam(a0,Xigma_vector,r,c);
epsilon = err0/1000;
a1 = a0 + eit;
err1 = getparam(a1,Xigma_vector,r,c);
while abs(err1-err0) >= epsilon
    if err1 < err0
        a1 = a1 + eit;
    else
        a1 = a1-eit;
    end
    err0 =err1;
    err1 = getparam(a1,Xigma_vector,r,c);
end
a = a1;
alpha = (Xigma_vector(1)*Xigma_vector(c)*(c-1)^a1)/(Xigma_vector(1)^(1/a1)-Xigma_vector(c)^(1/a1))^a;
beta = (c*Xigma_vector(c)^(1/a) - Xigma_vector(1)^(1/a))/(Xigma_vector(1)^(1/a)-Xigma_vector(c)^(1/a));
end


    
    




