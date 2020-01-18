a = {'a','b','c','c','d'};
b = {'a','c'};

for i=1:length(a)
    if ismember(a{i},b)
       a{i} = 'true';
    else
       a{i} = 'false';
    end
end