% Diagram Clustering

load('dataCluster.mat');

figure;
hold on
bar(error,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',1.5);

title('Silhouette Coefficient Error')
xlabel('Jumlah Dokumen')
ylabel('Data Error')
hold off

[doc,iterasi] = size(jumlahIterasi);
for i=1:300
    idx{i,1} = horzcat('Dokumen Ke-',num2str(i),'.html');
end

mat0 = num2cell(matClustering);
mat1 = {mat0,idx};
mat1 = [mat1{:}];
mat2 = sortrows(matClustering,1);

dt1 = sum(mat2(:,1)==1);
dt2 = sum(mat2(:,1)==2);
dt3 = sum(mat2(:,1)==3);

dataTotal = [dt1,dt2,dt3];

figure;
pie(dataTotal);

title('Total Kelompok')
legend('Kontra','Netral','Pro')