%PCA

function pcaMat = pcaMethod(W,jumPCA)

%Mencari rata-rata dari Matrix
[Baris,Kolom] = size(W);
rtadata = mean(W);

VarBar=W;
for i=1:Baris
    for j=1:Kolom
        VarBar(i,j)=W(i,j)-rtadata(j);
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
%     indexPCA=index;
    pcaMat=daBar(:,1:jumIndex);
else
%     indexPCA=index(1:jumPCA);
    pcaMat=daBar(:,1:jumPCA);
end

% rtData = mean(W);
% 
% % hitung covarience 
% bantu=0;
% fi=[]; % fi == vector fi ke-i (vector fi tanpa noise)
% for i=1:size(W,1)
%     bantu=bantu+1;
%     temp = W(bantu,:)-rtData;
%     fi = [fi:temp];
% end
% cov = fi*fi';
% 
% % hitung eigenvalue dan eigenvector
% % V=eigen vektor, D=nilai eigen/eigen value
% [V,D]=eig(cov);
% [D,index] = sort(diag(D));
% V_PCA=V;
% D = D(end:-1:1)';
% V = V(:,index(end:-1:1));
% 
% % Normalisasi Feature dari eigenvalue dan eigenvector
% %Membangun matriks yang mewakili matrixBobot
% Construct = W'*V; %akan menghasilkan principal component/eigenface
% 
% %Membentuk matriks Extract
% pcaMat = W*Construct;
% 
% 
