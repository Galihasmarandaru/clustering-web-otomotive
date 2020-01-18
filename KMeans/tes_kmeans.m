%b baca data
data_contoh = xlsread('kmeans.xlsx');

% data_clustering_2_dimensi
k = 3;
[idx,C,sumd,D] = kmeans(data_contoh, k);
figure('Position',[300 300 210 160]);
plot(data_contoh(idx==1,1),data_contoh(idx==1,2),'ko',data_contoh(idx==2,1), data_contoh(idx==2,2), 'k+', data_contoh(idx==3,1),data_contoh(idx==3,2),'kd','MarkerSize',6);
axis([0 9,0 9]);
hold on
plot(C(:,1),C(:,2),'kx','MarkerSize',8);
hold off
C
display('IDX | JARAK KE C1 | JARAK KE C2 | JARAK KE C3');
[idx D.^0.5]