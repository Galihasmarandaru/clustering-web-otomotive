% Diagram

function diagramClust(matClustering,C,minMax)

idx = matClustering(1:end,1);

figure;
plot(minMax(idx==1,1:end),'r.','MarkerSize',12)
hold on
plot(minMax(idx==2,1:end),'g.','MarkerSize',12)
hold on
plot(minMax(idx==3,1:end),'b.','MarkerSize',12)
hold on
plot(C(1,:),'kx',...
     'MarkerSize',15,'LineWidth',3) 
hold on
plot(C(2,:),'kx',...
     'MarkerSize',15,'LineWidth',3) 
hold on
plot(C(3,:),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Cluster 3','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off

% figure;
% gscatter(C(1,:),C(2,:),C(3,:),idx,'rbg','xod');