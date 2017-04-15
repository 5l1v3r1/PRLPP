function flag = judge_k(X,i,j,k,N)
flag = 0;
d = norm(X(:,i)-X(:,j),2);
kj = 0;
ki = 0;
for r=1:N
    if norm(X(:,r)-X(:,j),2)<d
        kj = kj + 1;
    end
    if norm(X(:,r)-X(:,i),2)<d
        ki = ki + 1;
    end
end
if (k_j<k) || (k_i<k)
    flag =1;
end   
end