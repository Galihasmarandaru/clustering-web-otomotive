function [ dataHasilPCA, indexPCA ] = PCA2( matrixBobot)
U=matrixBobot;
n=size(U);
R=mean(U,2);

minrata=[];
UD=double(U);
for i=1:n
    temp=UD(:,i)-R
    minrata=[minrata,temp];
end

% hitung covarience 
C=minrata'*minrata;

% hitung eigenvalue dan eigenvector dari covariance
[EVEC,EVAL]=eig(C);

% mengurutkan nilai eigenvalue dari terbesar ke terkecil dengan nilai
% masing-masing dari eigenvector
evaldiag=diag(EVAL);
[evaldiagsort,x]=sort(evaldiag,'descend');
matrikscirimax=EVEC(:,x);

% menghitung nilai eigenvector sebanyak matrix
Ui=minrata*matrikscirimax;

% memproyeksikan ke dalam eigenspace
W=(Ui*minrata)';
%====%
end

