
% Sinonim Kata

function sKata = synKata(newToken)

load('sinonimKata.mat');

[a,b] = size(newToken);
[x,y] = size(sinonimKata);

for i=1:a
    for j=1:x
        cmp01 = strcmp(newToken{i,1},sinonimKata{j,1});
        if (cmp01 == 1)
           sKata{i,1} = regexprep(newToken{i,1},sinonimKata{j,1},sinonimKata{j,y});
           break;
        else
           sKata{i,1} = newToken{i,1};
           continue;
        end
    end
end