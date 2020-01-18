% Stopword Removal
function varNew = stopwordRemoval(newToken)

sWords = importdata('stopWords.txt');

br = 1;
for i=1:length(newToken)
    cmp01 = strcmp(newToken{i},sWords);
    if (cmp01 == 1)
        break
    elseif (cmp01 == 0)
       varNew{br,1} = newToken{i};
       br = br + 1;
    end
end


