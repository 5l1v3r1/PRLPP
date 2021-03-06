function S = giveweight(S,N,X,k,t)
%W is a sparse symmetric square matrix and S(i,j) has the weight of the
%edge joining vertices i and j,and 0 if there is no such edge.
%k and t are two empirically prespecified parameters
for i=1:N
    for j=i+1:N
        if judge_k(X,i,j,k,N)
            S(i,j) = exp(-norm(X(:,i)-X(:,j),2)^2/t);
        end
    end
end
S = S + S' + eye(N);
end