% Baca Data
for i=1:300
    file_XML{i,1} = horzcat('text',num2str(i),'.html');

    % Baca data
    datastring{i,1} = bacaData(file_XML{i,1});

    %% PreProcessing Text
    % Tokenizing
    newToken{i,1} = tokenizing(datastring{i,1});
    
    % Stopword Removal
    varNew{i,1} = stopwordRemoval(newToken{i,1});

    % Stemming
    xDasar{i,1} = stemming(varNew{i,1});
        
    if i == 1
       % Ubah Menjadi Matriks
       dt = matriksKata(xDasar{i,1},file_XML{i,1});
    elseif i > 1
       % Update Matriks
       dt = updateMatriksKata(xDasar{i,1},file_XML{i,1},dt);
    end
end

load('dataTerm.mat')

%% Hitung Bobot
[W,n,k] = hitungBobot(dt);

%% Reduksi Dimensi Data
% Principal Component Analysis
pcaMat = pcaMethod(W,206);
testing = pcaMat(end-4:end,:);
trainMat = pcaMat(1:end-5,:);


%% Hitung Normalisasi
normData = normalisasi(trainMat, 'minmaxNorm');

%% Clustering
[C1,C2,C3,sortX] = varIn(normData);
[matClustering,jumlahIterasi] = kMeans(normData,C1,C2,C3,'euclidean');

[m1a,m1b,m1c,m2a,m2b,m2c,m3a,m3b,m3c]  = percentClust(matClustering);

%% Diagram dan Akurasi

error = silhouetteCoeff(trainMat, matClustering(1:end,1), 'cosine');

errMean = mean(error,1);

%% Test Data Tunggal

[idxTesting,newDist] = hitungJarak(testing,C1,C2,C3,5,'euclidean');

errorTesting = silhouetteCoeff(testing, idxTesting, 'cosine');

errTestingMean = mean(errorTesting,1);