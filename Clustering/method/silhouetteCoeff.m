function errSil = silhouetteCoeff(X, clust, jarak)

  % Fungsi Jarak
  function [dist] = EuclideanDist(x, y)
    dist = sqrt((x - y) * (x - y)');
  end
  
  function [dist] = cosineDist(x, y)
    cosineValue = dot(x,y)/(norm(x,2)*norm(y,2));
    dist = 1 - cosineValue;
  end

  function [dist] = cityblockDist(x,y)
      dt = [x;y]';
      ct = dt(:,1) - dt(:,2);
      dist = sum(abs(ct),1);
  end

  errSil = zeros(size(X, 1), 1);
  
  %  hitung nilai silhouette coefficient per dokumen
  for i = 1:length(errSil)
    
    iii2all = zeros(size(X, 1), 1);
    for j = 1:size(X, 1)
        switch (jarak)
          case 'euclidean'
            iii2all(j) = EuclideanDist(X(i, :), X(j, :));
          case 'cityblock'
            iii2all(j) = cityblockDist(X(i, :), X(j, :));
          case 'cosine'
            iii2all(j) = cosineDist(X(i, :), X(j, :));
          otherwise
            error('Metric salah.');
        end
    end
    
    % mengalokasikan nilai ke cluster
    clusterIDs = unique(clust); % contoh [1; 2; 3; 4]
    groupedValues = {};
    for j = 1:length(clusterIDs)
      groupedValues{clusterIDs(j)} = [iii2all(clust == clusterIDs(j))];
    end
    
    
    %%% Hitung a(i)
    % jarak objek i ke semua objek lain di cluster yang sama
    a_iii = groupedValues{clust(i)};
    % jarak rata-rakda ta dari i ke semua objek lain di cluster yang sama
    a_i = sum(a_iii) / (size(a_iii, 1) - 1);
    
    
    % Hitung b(i)
    clusterIDs_new = clusterIDs;
    % hapus cluster i
    clusterIDs_new(clusterIDs_new == clust(i)) = [];
    % jarak rata-rata dari i ke semua objek dari cluster lain
    a_iii_2others = zeros(length(clusterIDs_new), 1);
    for j = 1:length(clusterIDs_new)
      values_another = groupedValues{clusterIDs_new(j)};
      a_iii_2others(j) = mean(values_another);
    end
    b_i = min(a_iii_2others);
    
    
    % Hitung s(i)
    errSil(i) = (b_i - a_i) / max([a_i; b_i]);
    
  end
  
end