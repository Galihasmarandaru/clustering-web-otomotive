% Inisialisasi Variance

% function [C1,C2,C3,sortX] = varIn(normX)
% 
% stdX = std(normX);
% 
% mx = max(stdX);
% 
% idx = find(stdX==mx);
% 
% i = idx;
% 
% normIDX = normX(1:end,i);
% 
% sortX = sort(normIDX);
% 
% [a,b] = size(sortX);
% 
% x = a/3;
% 
% kel1 = sortX(1:x);
% kel2 = sortX((x+1):(x*2));
% kel3 = sortX(((x*2)+1):end);
% 
% md1 = round(median(kel1),3);
% md2 = round(median(kel2),3);
% md3 = round(median(kel3),3);
% 
% normIDX = round(normIDX,3)';
% 
% c1 = find(normIDX==md1);
% c2 = find(normIDX==md2);
% c3 = find(normIDX==md3);
% 
% C1 = normX(c1(2),1:end);
% C2 = normX(c2(2),1:end);
% C3 = normX(c3(2),1:end);

function [C1,C2,C3,sortX] = varIn(normX)

stdX = std(normX);

mx = max(stdX);

idx = find(stdX==mx);

i = idx;

% normIDX = normX(1:end,i);

sortX = sortrows(normX,i);

[a,b] = size(sortX);

x = a/3;

kel1 = sortX(1:x,:);
kel2 = sortX((x+1):(x*2),:);
kel3 = sortX(((x*2)+1):end,:);

C1 = mean(kel1,1);
C2 = mean(kel2,1);
C3 = mean(kel3,1);

% C1 = sortX(50,1:end);
% C2 = sortX(150,1:end);
% C3 = sortX(250,1:end);

