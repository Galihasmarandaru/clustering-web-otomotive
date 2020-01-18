% update matriks kata

function dt = updateMatriksKata(xDasar,file_XML,dt)

mKata = unique(xDasar,'stable').';

[m,n] = size(dt);

dt{m+1,1} = cellstr(file_XML);

diff = setdiff(mKata,dt(1,2:n));

for i=1:length(diff)
    dt{1,end+1} = diff{i};
end

tKata=cellfun(@(updateMatriksKata) sum(ismember(xDasar,updateMatriksKata)),dt(1,2:end),'un',0);

for j=1:(length(dt)-1)
    for k=1:(length(mKata))
        cmp01 = strcmp(dt{1,j+1},mKata{k});
        if (cmp01 == 1)
           dt{m+1,j+1} = tKata{j};
        end
    end
end