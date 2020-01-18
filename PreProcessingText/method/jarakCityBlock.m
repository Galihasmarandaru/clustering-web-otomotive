% jarak cityblock
function [idx,dist] = jarakCityBlock(minMax,C1,C2,C3,a,b)

for i=1:a
    for j=1:b
        cJarak1(i,j) = abs(sum(C1(1,i),minMax(i,j)));
        cJarak2(i,j) = abs(sum(C2(1,i),minMax(i,j)));
        cJarak3(i,j) = abs(sum(C3(1,i),minMax(i,j)));
    end
end
for i=1:a
    sumJarak(i,1) = sum(cJarak1,2);
    sumJarak(i,2) = sum(cJarak2,2);
    sumJarak(i,3) = sum(cJarak3,2);
end
for i=1:a
    idx(i,1) = find(sumJarak(i,1:end)==max(sumJarak(i,1:end)));
    dist(i,1) = max(sumJarak(i,1:end));
end