load('varIn')

[a,b] = size(minMax);

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
end

nMtx = [minMax,idx];

sortMtx = sortrows(nMtx,b+1);

for i=1:a
    for j=1:b
        if (nMtx(i,b+1)==1)
           c1New(i,j) = nMtx(i,j);
        elseif (nMtx(i,b+1)==2)
           c2New(i,j) = mean(nMtx(i,j));
        elseif (nMtx(i,b+1)==3)
           c3New(i,j) = mean(nMtx(i,j));
        end
    end
end

c1New = mean(c1New);
c2New = mean(c2New);
c3New = mean(c3New);

%% baru

for i=1:a
    dotx1(i,1) = dot(c1New,minMax(i,1:end));
    dotx2(i,1) = dot(c2New,minMax(i,1:end));
    dotx3(i,1) = dot(c3New,minMax(i,1:end));
end

sumxC1 = sqrt(sum(c1New.^2));
sumxC2 = sqrt(sum(c2New.^2));
sumxC3 = sqrt(sum(c3New.^2));

for i=1:a
    sumxd(i,1) = sqrt(sum(minMax(i,1:end).^2));
end

for i=1:a
    cosXSim(i,1) = (dotx1(i))/(sumxC1*sumxd(i));
    cosXSim(i,2) = (dotx2(i))/(sumxC2*sumxd(i));
    cosXSim(i,3) = (dotx3(i))/(sumxC3*sumxd(i));
end

for i=1:a
    idxX(i,1) = find(cosXSim(i,1:end)==max(cosXSim(i,1:end)));
end

nMtx2 = [minMax,idx];

sortMtx2 = sortrows(nMtx2,b+1);

for i=1:a
    for j=1:b
        if (nMtx2(i,b+1)==1)
           c1New2(i,j) = nMtx2(i,j);
        elseif (nMtx2(i,b+1)==2)
           c2New2(i,j) = mean(nMtx2(i,j));
        elseif (nMtx2(i,b+1)==3)
           c3New2(i,j) = mean(nMtx2(i,j));
        end
    end
end

c1New2 = mean(c1New2);
c2New2 = mean(c2New2);
c3New2 = mean(c3New2);

%% baru 2

for i=1:a
    doty1(i,1) = dot(c1New2,minMax(i,1:end));
    doty2(i,1) = dot(c2New2,minMax(i,1:end));
    doty3(i,1) = dot(c3New2,minMax(i,1:end));
end

sumyC1 = sqrt(sum(c1New2.^2));
sumyC2 = sqrt(sum(c2New2.^2));
sumyC3 = sqrt(sum(c3New2.^2));

for i=1:a
    sumyd(i,1) = sqrt(sum(minMax(i,1:end).^2));
end

for i=1:a
    cosYSim(i,1) = (doty1(i))/(sumyC1*sumyd(i));
    cosYSim(i,2) = (doty2(i))/(sumyC2*sumyd(i));
    cosYSim(i,3) = (doty3(i))/(sumyC3*sumyd(i));
end

for i=1:a
    idxY(i,1) = find(cosYSim(i,1:end)==max(cosYSim(i,1:end)));
end

nMtx3 = [minMax,idx];

sortMtx3 = sortrows(nMtx3,b+1);

for i=1:a
    for j=1:b
        if (nMtx3(i,b+1)==1)
           c1New3(i,j) = nMtx3(i,j);
        elseif (nMtx3(i,b+1)==2)
           c2New3(i,j) = mean(nMtx3(i,j));
        elseif (nMtx3(i,b+1)==3)
           c3New3(i,j) = mean(nMtx3(i,j));
        end
    end
end

c1New3 = mean(c1New3);
c2New3 = mean(c2New3);
c3New3 = mean(c3New3);

%% baru 3

for i=1:a
    dotz1(i,1) = dot(c1New3,minMax(i,1:end));
    dotz2(i,1) = dot(c2New3,minMax(i,1:end));
    dotz3(i,1) = dot(c3New3,minMax(i,1:end));
end

sumzC1 = sqrt(sum(c1New3.^2));
sumzC2 = sqrt(sum(c2New3.^2));
sumzC3 = sqrt(sum(c3New3.^2));

for i=1:a
    sumzd(i,1) = sqrt(sum(minMax(i,1:end).^2));
end

for i=1:a
    cosZSim(i,1) = (dotz1(i))/(sumzC1*sumzd(i));
    cosZSim(i,2) = (dotz2(i))/(sumzC2*sumzd(i));
    cosYSim(i,3) = (doty3(i))/(sumyC3*sumyd(i));
end

for i=1:a
    idxZ(i,1) = find(cosZSim(i,1:end)==max(cosZSim(i,1:end)));
end

nMtx4 = [minMax,idx];

sortMtx4 = sortrows(nMtx4,b+1);

for i=1:a
    for j=1:b
        if (nMtx4(i,b+1)==1)
           c1New4(i,j) = nMtx4(i,j);
        elseif (nMtx4(i,b+1)==2)
           c2New4(i,j) = mean(nMtx4(i,j));
        elseif (nMtx4(i,b+1)==3)
           c3New4(i,j) = mean(nMtx4(i,j));
        end
    end
end

c1New4 = mean(c1New4);
c2New4 = mean(c2New4);
c3New4 = mean(c3New4);

%% baru 4

for i=1:a
    dotu1(i,1) = dot(c1New4,minMax(i,1:end));
    dotu2(i,1) = dot(c2New4,minMax(i,1:end));
    dotu3(i,1) = dot(c3New4,minMax(i,1:end));
end

sumuC1 = sqrt(sum(c1New4.^2));
sumuC2 = sqrt(sum(c2New4.^2));
sumuC3 = sqrt(sum(c3New4.^2));

for i=1:a
    sumud(i,1) = sqrt(sum(minMax(i,1:end).^2));
end

for i=1:a
    cosUSim(i,1) = (dotu1(i))/(sumuC1*sumud(i));
    cosUSim(i,2) = (dotu2(i))/(sumuC2*sumud(i));
    cosUSim(i,3) = (dotu3(i))/(sumuC3*sumud(i));
end

for i=1:a
    idxU(i,1) = find(cosUSim(i,1:end)==max(cosUSim(i,1:end)));
end