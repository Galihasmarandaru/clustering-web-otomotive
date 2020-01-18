function [dtaHslPCA, indexPCA] = PCA (matrixBobot, jumPCA)
%Mencari rata-rata dari Matrix
[Baris,Kolom] = size(matrixBobot);
rtadata = mean(matrixBobot);

VarBar=matrixBobot;
for i=1:Baris
    for j=1:Kolom
        VarBar(i,j)=matrixBobot(i,j)-rtadata(j);
    end
end

% hitung covarience 
Cov=cov(VarBar);

% hitung eigenvector dan eigenvalue dari covarience
[eigenvector,eigenvalue]=eig(Cov);

% memilih dan mengambil nilai yg paling besar dari eigenvector dan
% eigenvalue
eigenvalue=diag(eigenvalue);
[~, index]=sort(eigenvalue,'descend');
fiturVector=eigenvector(:,index);

% membuat satu set data baru
daBar = VarBar*fiturVector;

% jumlahPCA, digunakan untuk pemotongan data
if jumPCA==0
    [jumIndex,~]=size(index);
    indexPCA=index;
    dtaHslPCA=daBar(:,1:jumIndex);
else
    indexPCA=index(1:jumPCA);
    dtaHslPCA=daBar(:,1:jumPCA);
end



