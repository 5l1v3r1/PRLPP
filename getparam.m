function err = getparam(a1,Xigma_vector,r,c)
alpha = (Xigma_vector(1)*Xigma_vector(c)*(c-1)^a1)/(Xigma_vector(1)^(1/a1)-Xigma_vector(c)^(1/a1))^a;
beta = (c*Xigma_vector(c)^(1/a) - Xigma_vector(1)^(1/a))/(Xigma_vector(1)^(1/a)-Xigma_vector(c)^(1/a));
err = 0;
for i=1:r
    err = err + norm((alpha/(i+beta)^a1)-Xigma_vector(i),2);
end
