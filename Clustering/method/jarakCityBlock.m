% jarak cityblock
function [idxTesting,newDist] = jarakCityBlock(normalisasi,C1,C2,C3,a)

for i=1:a
    x1 = [C1(1,:);normalisasi(i,:)]';
    x2 = [C2(1,:);normalisasi(i,:)]';
    x3 = [C3(1,:);normalisasi(i,:)]';
    
    ab1 = x1(:,1) - x1(:,2);
    ab2 = x2(:,1) - x2(:,2);
    ab3 = x3(:,1) - x3(:,2);
    
    dist1 = sum(abs(ab1),1);
    dist2 = sum(abs(ab2),1);
    dist3 = sum(abs(ab3),1);
    
    distX(i,:) = [dist1,dist2,dist3];
    
    idxTesting(i,1) = find(distX(i,:)==min(distX(i,:)));
    newDist(i,1) = min(distX(i,:));
end

