% hitungJarak

function [idx,dist] = hitungJarak(normalisasi,C1,C2,C3,a,jarak)

switch(jarak)
    case 'cosine'
        [idx,dist] = jarakCosinus(normalisasi,C1,C2,C3,a);
    case 'euclidean'
        [idx,dist] = jarakEuclidean(normalisasi,C1,C2,C3,a);
    case 'cityblock'
        [idx,dist] = jarakCityBlock(normalisasi,C1,C2,C3,a);
end