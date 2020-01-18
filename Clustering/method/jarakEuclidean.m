% Euclidean
function [idxTesting,newDist] = jarakEuclidean(normalisasi,C1,C2,C3,a)

for i=1:a
    dist1 = sqrt(abs((normalisasi(i,:) - C1(1,:)) * (normalisasi(i,:) - C1(1,:))'));
    dist2 = sqrt(abs((normalisasi(i,:) - C2(1,:)) * (normalisasi(i,:) - C2(1,:))'));
    dist3 = sqrt(abs((normalisasi(i,:) - C3(1,:)) * (normalisasi(i,:) - C3(1,:))'));
    
    distX(i,:) = [dist1,dist2,dist3];
    
    idxTesting(i,1) = find(distX(i,:)==min(distX(i,:)));
    newDist(i,1) = min(distX(i,:));
end