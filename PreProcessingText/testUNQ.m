
% for i=1:2
%     unqDasar{i,1} = unique(synDasar{1,i});
% end


for i=1:300
    unqDasar{1,i} = unique(synDasar{1,i}');
end
QDasar = horzcat(unqDasar{:});

QDasar2 = unique(QDasar);