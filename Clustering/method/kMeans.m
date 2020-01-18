
function [matClustering,idx] = kMeans(normalisasi,C1,C2,C3,jarak)

[a,b] = size(normalisasi);

n = 1;
[idx(:,n),dist(:,n)] = hitungJarak(normalisasi,C1,C2,C3,a,jarak);
n = n + 1;

for x=1:100

    clear mC1New mC2New mC3New;
    clear C1New C2New C3New;
    nMtx = [normalisasi,idx(1:end,x)];

    sortMat = sortrows(nMtx,b+1);
    
    n1 = 1;n2 = 1;n3 = 1;
    for i=1:a
        if (sortMat(i,b+1)==1)
           mC1New(n1,:) = sortMat(i,1:b);
           n1 = n1 + 1;
        elseif (sortMat(i,b+1)==2)
           mC2New(n2,:) = sortMat(i,1:b);
           n2 = n2 + 1;
        elseif (sortMat(i,b+1)==3)
           mC3New(n3,:) = sortMat(i,1:b);
           n3 = n3 + 1;
        end
    end

    C1New = mean(mC1New,1);
    C2New = mean(mC2New,1);
    C3New = mean(mC3New,1);
    
    [idx(:,n),dist(:,n)] = hitungJarak(normalisasi,C1New,C2New,C3New,a,jarak);
    n = n + 1;
    
    if isequal(idx(1:end,x),idx(1:end,x+1))
        break;
    end
end

matClustering = [idx(1:end,end),dist(1:end,end)];