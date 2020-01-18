% Normalisasi

function normData = normalisasi(dataReduksi, norm)

switch (norm)
    case 'zscoreNorm'
        normData = zScore(dataReduksi);
    case 'minmaxNorm'
        normData = minmax(dataReduksi);
end