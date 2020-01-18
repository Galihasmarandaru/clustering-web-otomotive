% Kombinasi total error

kombinasiErr = [36.3333,56.0000;
                41.0000,42.3333;
                77.0000,82.6667;
                44.6667,73.6667;
                41.0000,72.0000;
                70.0000,80.3333;
                35.6667,56.3333;
                41.6667,40.0000;
                73.3333,81.0000];

x = [1;2;3;4;5;6;7;8;9];
y1 = kombinasiErr(:,1); % zscore
y2 = kombinasiErr(:,2); % minmax

figure;
hold on
plot(x,y1,'-o','MarkerIndices',find(y1(:)==y1(:)),...
    'LineWidth',4,...
    'MarkerSize',10,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor','blue');
hold on
plot(x,y2,'-o','MarkerIndices',find(y2(:)==y2(:)),...
    'LineWidth',4,...
    'MarkerSize',10,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor','red');
hold off

title('Total Kombinasi Error')
xlabel('Jumlah Kombinasi Error')
ylabel('Rata-rata Error')
legend('zscore','minmax')