function [cntrs] = Kmeans_func(X,k)

[N, M] = size(X);

k = 16;

p = randperm(N,k);

cntrs = X(p,:);

arr = ones(k,1);
tic;
while min(arr) ~= 0

[~,I] = pdist2(cntrs,X(1:N,:),'euclidean','Smallest',1);
cntrs_prev = cntrs;

for i = 1:k
    
    sumk = 0;
    count = 0;
    for j = 1:N
        
        if(I(j)== i)
            
            sumk = sumk + X(j,:);
            count = count + 1;
           
        end
    end
    
    cntrs(i,:) = sumk/ count;
    if(isequal(cntrs(i,:),cntrs_prev(i,:)) == 0)
        arr(i) = 0;
    else
        arr(i) = 1;
    end
end

end
toc;




