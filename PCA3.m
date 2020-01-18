%PCA
new=matrixBobot;
rtadata = mean(new);

% hitung covarience 
bantu=0;
fi=[]; % fi == vector fi ke-i (vector fi tanpa noise)
for i=1:size(new,1)
    bantu=bantu+1;
    temp = new(bantu,:)-rtadata;
    fi = [fi:temp];
end
cov = fi*fi';

% hitung eigenvalue dan eigenvector
% V=eigen vektor, D=nilai eigen/eigen value
[V,D]=eig(cov);
[D,index] = sort(diag(D));
V_PCA=V;
D = D(end:-1:1)';
V = V(:,index(end:-1:1));

% Normalisasi Feature dari eigenvalue dan eigenvector
%Membangun matriks yang mewakili matrixBobot
Construct = new'*V; %akan menghasilkan principal component/eigenface

%Membentuk matriks Extract
Extract = new*Construct;

[Baris,Kolom]=size(Extract);
%Mencari Nilai Extract Max
Emax = max (Extract);
Extractmax = max(Emax);

%Mencari Nilai Extract Min
Emin = min (Extract);
Extractmin = min(Emin);

for i=1:Baris
    for j=1:Kolom
        Normalisasi(i,j)=1+2*(Extract(i,j)-Extractmin)/(Extractmax-Extractmin);
    end
end
