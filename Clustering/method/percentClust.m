
function [m1a,m1b,m1c,m2a,m2b,m2c,m3a,m3b,m3c]  = percentClust(matClustering)

clst = xlsread('dataKel.xlsx');

dtKel = [clst,matClustering(:,1)];

m1a = strcat(num2str((sum(sort(dtKel(1:sum(dtKel(1:end,1)==1),2))==1)/sum(dtKel(1:end,1)==1))*100),"%");
m1b = strcat(num2str((sum(sort(dtKel(1:sum(dtKel(1:end,1)==1),2))==2)/sum(dtKel(1:end,1)==1))*100),"%");
m1c = strcat(num2str((sum(sort(dtKel(1:sum(dtKel(1:end,1)==1),2))==3)/sum(dtKel(1:end,1)==1))*100),"%");

m2a = strcat(num2str((sum(sort(dtKel(1:sum(dtKel(1:end,1)==2),2))==1)/sum(dtKel(1:end,1)==2))*100),"%");
m2b = strcat(num2str((sum(sort(dtKel(1:sum(dtKel(1:end,1)==2),2))==2)/sum(dtKel(1:end,1)==2))*100),"%");
m2c = strcat(num2str((sum(sort(dtKel(1:sum(dtKel(1:end,1)==2),2))==3)/sum(dtKel(1:end,1)==2))*100),"%");

m3a = strcat(num2str((sum(sort(dtKel(1:sum(dtKel(1:end,1)==3),2))==1)/sum(dtKel(1:end,1)==3))*100),"%");
m3b = strcat(num2str((sum(sort(dtKel(1:sum(dtKel(1:end,1)==3),2))==2)/sum(dtKel(1:end,1)==3))*100),"%");
m3c = strcat(num2str((sum(sort(dtKel(1:sum(dtKel(1:end,1)==3),2))==3)/sum(dtKel(1:end,1)==3))*100),"%");