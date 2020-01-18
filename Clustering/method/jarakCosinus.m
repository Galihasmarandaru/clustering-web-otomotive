% jarak Cosinus
function [idx,dist] = jarakCosinus(minMax,C1,C2,C3,a)

for i=1:a
    dot1(i,1) = dot(C1,minMax(i,1:end));
    dot2(i,1) = dot(C2,minMax(i,1:end));
    dot3(i,1) = dot(C3,minMax(i,1:end));
end

sumC1 = sqrt(sum(C1.^2));
sumC2 = sqrt(sum(C2.^2));
sumC3 = sqrt(sum(C3.^2));

for i=1:a
    sumd(i,1) = sqrt(sum(minMax(i,1:end).^2));
end

for i=1:a
    cosSim(i,1) = (dot1(i))/(sumC1*sumd(i));
    cosSim(i,2) = (dot2(i))/(sumC2*sumd(i));
    cosSim(i,3) = (dot3(i))/(sumC3*sumd(i));
end

for i=1:a
    idx(i,1) = find(cosSim(i,1:end)==max(cosSim(i,1:end)));
    dist(i,1) = max(cosSim(i,1:end));
end