% kata Berulang

function [kBerulang,tBerulang] = kataBerulang(newData2)

cond_4b = '([a-z]+)([-])([a-z]+)';

% mengambil kata berulang
bk = 1;
for k=1:length(newData2)
    ganda{bk,1} = regexp(newData2{k,1},cond_4b,'match');
    bk=bk+1;
end

% pindah ke 1 baris

bk2 = 1;
for i=1:length(ganda)
    for j=1:length(ganda{i})
        if (~isempty(ganda{i}{j}))
           kBerulang{bk2,1} = ganda{i}{j};
           bk2 = bk2 + 1;
        end
    end
end

bk2 = 1;
for i=1:length(kBerulang)
   tBerulang(bk2,1) = regexprep(kBerulang{i},'\<(\w+)(-)','');
   bk2 = bk2 + 1;
end