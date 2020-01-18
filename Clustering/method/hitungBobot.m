% Pembobotan
function [W,n,k] = hitungBobot(dt)

% load('dt')

[a,b] = size(dt);
x = a-1;
z = b-1;

% hitung TF
for i=1:x
    for j=1:z
        if ~isempty(dt{i+1,j+1})
            n{i,j} = dt{i+1,j+1};
        else
            n{i,j} = 0;
        end
    end
end

for i=1:x
    for j=1:z
        if (n{i,j} ~= 0)
            r{i,j} = 1;
        else
            r{i,j} = 0;
        end
    end
end

k = cell2mat(r);

% Hitung df
df = sum(k);

% hitung D/df
dokPerDf = x./df;

% % hitung IDF
IDF = log(dokPerDf);

IDFx = IDF+1;

% hitung Bobot (w)
W = cell2mat(n).*IDFx;

