% % Baca Data
for i=1:305
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

load('dataRun3.mat');

%% Hitung Bobot
[W,n,k] = hitungBobot(dt);

%% Reduksi Dimensi Data
% Principal Component Analysis
pcaMat = pcaMethod(W,250);
testing = pcaMat(301:end,:);
trainMat = pcaMat(1:300,:);


%% Hitung Normalisasi
% zScore = zscore(pcaMat);
minMax = minmax(trainMat);

%% Clustering
[C1,C2,C3,sortX] = varIn(minMax);
[matClustering,jumlahIterasi] = clustering(minMax,C1,C2,C3);

%% Diagram dan Akurasi

error = silhouetteCoeff(trainMat, matClustering(1:end,1), 'cosine');

errMean = mean(error,1);

%% Test Data Tunggal
% load('testing.mat')
for i=1:5
    x1 = [C1(1,:);testing(i,:)]';
    x2 = [C2(1,:);testing(i,:)]';
    x3 = [C3(1,:);testing(i,:)]';
    
    ab1 = x1(:,1) - x1(:,2);
    ab2 = x2(:,1) - x2(:,2);
    ab3 = x3(:,1) - x3(:,2);
    
    % city block
    dist1 = sum(abs(ab1),1);
    dist2 = sum(abs(ab2),1);
    dist3 = sum(abs(ab3),1);
    
    newDist(i,:) = [dist1,dist2,dist3];
    
    idxTesting(i,:) = find(newDist(i,:)==min(newDist(i,:)));
end