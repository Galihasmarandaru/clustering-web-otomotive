
function [matClustering,idx] = clustering(dataNormalization,c1,c2,c3)

[idx,dist] = kMeans(dataNormalization,c1,c2,c3);
matClustering = [idx(1:end,end),dist(1:end,end)];
 
