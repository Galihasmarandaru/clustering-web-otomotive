% Matriks Kata

function dt = matriksKata(xDasar,file_XML)

mKata = unique(xDasar,'stable').';

tKata=cellfun(@(matriksKata) sum(ismember(xDasar,matriksKata)),mKata,'un',0);

dt{2,1} = cellstr(file_XML);


for j=1:length(mKata)
    dt{1,j+1} = mKata{j};
end

for k=1:length(tKata)
    dt{2,k+1} = tKata{k};
end

