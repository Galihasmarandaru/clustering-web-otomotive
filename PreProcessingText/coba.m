% br = {'a','b','c'};
% bk = {'z','u','b'};
% 
% a = 1;
% for i=1:length(br)
%     cmp01 = strcmp(br{i},bk);
%     if(cmp01 == 1)
%        break
%     elseif(cmp01 == 0)
%        b{a} = br{i};
%        a = a + 1;
%     end
% end

% a = 'anta andi 0* akan';
% 
% % b = 1;
% % for i=1:length(a(1:end))
%     data = regexp(a,'([a-z]+)','match');
% %     b = b + 1;
% % end

% p = 'andi akan <div> <p> setelahnya </p> <p>akunya dia</p>';
% 
% x = char(regexp(p,'<p.*?>(.*?)</p>','match'));

% x = char(x);

% for i=1:5
%     p{i,1} = horzcat('nama',num2str(i));
% end

% x = 5;
% n = zeros(x,1);
% for i=1:length(x)
%     n{i,1} = x(i); 
% end

% s = 10;
% H = zeros(s,1);
% 
% for c = 1:s
%     H(c) = {'nama',c};
% end

%  n=4;
%  courseNames = cell(n,1);   % pre-size classNames as a row vector
%  for k=1:n
%      courseNames{k} = input('Enter the course name : ','s');
%  end
%  
%  % convert courseNames to a character matrix
%  courseNames = cell(courseNames);
 
 % write this variable to file
%  save('myCourseNames.mat','courseNames');

% p = {'a','q','w';'b','x','j';'v','b','m'};
% 
% n = zeros(2,2);
% 
% for i=1:2
%     for j=1:2
%         x{i,j} = p{i+1,j+1};
%     end
% end


% n = {'tidak suka anton bukan baik'};
% cond_negasi = '\<(tidak|bukan|nggak)(\s)(\w*)';
% r = regexp(n,cond_negasi,'match');
% r = regexprep(n,'\s','');
% newData2 = 'tiba-tiba aku menjadi 67 &8* bukan dia';
% 
% kBerulang = regexp(newData2,'(([a-z]+)([-])([a-z]+)|\<(tidak|bukan|nggak)(\s)(\w*))','match');

x = {'sandar'};
y = horcat('~',x);