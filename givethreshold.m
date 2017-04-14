function c=givethreshold(Xigma,zat)
%Xigma is d-dimension square matrix
%zat is energy percentage
J=Inf;
[~,d]=size(Xigma);
c=d;
Xigma_vector = Xigma*ones(d,1);
for temc=1:d
    temJ = temc*(sum(Xigma_vector(1:c)))/sum(Xigma_vector);
    if temJ >= zat
        if temJ<J
            J = temJ;
            c=temc;
        end
    end
end
end

