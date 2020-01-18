
s1 = {'galih';'galah'};
s2 = {'galep';'galop';'galap'};

a = 1;
for i=1:length(s1)
    for j=1:length(s2)
        % Levenhstein =============================================================
        mtx = (1:length(s1{i})+1)'*(1:length(s2{j})+1)-1; % buat matrix
        for n=1:length(s1{i}) % external loop over string s1 (matrix rows)
            for k=1:length(s2{j}) % internal loop over string s2 (matrix columns)
                temp = mtx(n,k); % current position's edit distance is loaded
                if not(s1{i}(n) == s2{j}(k)) % bila karakter tidak sama
                    temp = min([temp,mtx(n,k+1),mtx(n+1,k)])+1; % cari minimum + 1
                end
                mtx(n+1,k+1) = temp; % updates the new edit distance end;
            end
        end
        edist{i,j} = mtx(end,end); % the edit distance between s1 and s2 is the last element
        % =========================================================================
        if (edist{i,j} == 0)
            xNew{a,1} = s2{j};
            a = a + 1;
        end
    end
end