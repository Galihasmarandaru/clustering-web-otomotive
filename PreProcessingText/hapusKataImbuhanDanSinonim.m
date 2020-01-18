function [iDasar] = hapusKataImbuhanDanSinonim(nonDasar)

kDasar = importdata('kataDasar.txt');

cmp01 = strcmp(nonDasar,kDasar);

if (cmp01 == 0)
    if (regexp(nonDasar,'(\<(?:be)[^r][a-z]+(i)\>)|(\<(?:se)[a-z]+(i|(?:kan)\>)|(\<(?:di)[a-z]+[^k](?:an)\>)|(\<(?:ke)[a-z]+(i|(?:kan))\>)'))  
        iDasar = nonDasar;
        %     synDasar = '0';
 elseif (regexp(nonDasar, '\<(tidak|bukan|ngk|nggak|ngggak|gak|ndak)\w+'))
       nonNDasar = regexprep(nonDasar, '((tidak)|(bukan)|(ngk)|(nggak)|(ngggak)|(gak)|(ndak))','');
        % suffiks
       iDasar = Akhiran(nonNDasar,kDasar);

       cmp1 = strcmp(iDasar,kDasar);
       if (cmp1 == 0)
          % Prefiks
          iDasar = Awalan(nonNDasar,kDasar);

          cmp2 = strcmp(iDasar,kDasar);
          if (cmp2 == 0)
             % Konfiks
             iDasar = Akhiran(nonNDasar,kDasar);
             iDasar = Awalan(iDasar,kDasar);
             iDasar = strcat('~',iDasar);
             %     synDasar = '0';
          else
             iDasar = strcat('~',iDasar);
             %     synDasar = '0';
          end
       else
           iDasar = strcat('~',iDasar);
           %     synDasar = '0';
       end  
    else
       % suffiks
       iDasar = Akhiran(nonDasar,kDasar);

       cmp1 = strcmp(iDasar,kDasar);
       if (cmp1 == 0)
          % Prefiks
          iDasar = Awalan(nonDasar,kDasar);

          cmp2 = strcmp(iDasar,kDasar);
          if (cmp2 == 0)
             % Konfiks
             iDasar = Akhiran(nonDasar,kDasar);
             iDasar = Awalan(iDasar,kDasar);
             
%              cmp3 = strcmp(mDasar,kDasar);
%              if (cmp3 == 0)
%                  synDasar = mDasar;
%                  iDasar = '0';
%              else
%                  iDasar = mDasar;
%                  synDasar = '0';
%              end
%           else
%               iDasar = mDasar;
%               synDasar = '0';
          end
%        else
%            iDasar = mDasar;
%            synDasar = '0';
       end   
    end
else 
    iDasar = nonDasar;
%     synDasar = '0';
end

      