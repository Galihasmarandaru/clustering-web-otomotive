
% Normalisasi
function [minMax] = minmax(W)

[Baris,Kolom]=size(W);
% Mencari Nilai Extract Max
Emax = max (W);
Extractmax = max(Emax);

% Mencari Nilai Extract Min
Emin = min (W);
Extractmin = min(Emin);

for i=1:Baris
    for j=1:Kolom
        minMax(i,j)=1+2*(W(i,j)-Extractmin)/(Extractmax-Extractmin);
    end
end