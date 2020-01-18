% Stemming

function [xDasar] = stemming(varNew)

kDasar = importdata('kataDasar.txt');

iDasar = cellfun(@hapusKataImbuhan,cellstr(varNew),'UniformOutput',false);

x = 1;
for i=1:length(iDasar)
    for j=1:length(kDasar)
        cmp02 = strcmp(iDasar{i},kDasar{j});
        if (cmp02 == 1)
            nDasar{x,1} = iDasar{i};
            x = x + 1;
        end
    end
end

y = 1; mDasar = '';
for i=1:length(iDasar)
    if (regexp(iDasar{i},'\<(~)'))
       mDasar{y,1} = iDasar{i};
       y = y + 1;
    end
end

if ~isempty(mDasar)
    xDasar = sort([nDasar;mDasar]);
else
    xDasar = sort(nDasar);
end
