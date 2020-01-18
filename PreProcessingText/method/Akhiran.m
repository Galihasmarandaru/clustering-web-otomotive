% Akhiran

function [xDasar] = Akhiran(nonDasar,kDasar)

   xDasar = regexprep(nonDasar,'((?:lah)|(?:kah))\>','');
   
   cmp7 = strcmp(xDasar,kDasar);
   if (cmp7 == 0)
      xDasar = regexprep(xDasar,'((?:ku)|(?:mu)|(?:nya)|(?:pun))\>','');
   end

   cmp6 = strcmp(xDasar,kDasar);
   if (cmp6 == 0)
           if (regexp(xDasar,'(i)\>'))
               xDasar = regexprep(xDasar,'(i)\>','');
               
               cmp6c = strcmp(xDasar,kDasar);
               if (cmp6c == 0)
                  xDasar = regexprep(xDasar,'(^(\s\w\d))\>','i');
               end
           elseif (regexp(xDasar,'(?:an)\>'))
                  xDasar = regexprep(xDasar,'(?:an)\>','');
                  cmp6a = strcmp(xDasar,kDasar);
                  if (cmp6a == 0)
                     if (regexp(xDasar,'(k)\>'))
                         xDasar = regexprep(xDasar,'(k)\>',''); 
                         cmp6b = strcmp(xDasar,kDasar);
                         if (cmp6b == 0)
                            xDasar = regexprep(xDasar,'(^(\s\w\d))\>','k'); 
                         end
                     end
                  end
           end
   end
   