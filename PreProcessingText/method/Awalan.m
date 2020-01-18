% Awalan

function [xDasar] = Awalan(nonDasar,kDasar)

sKhusus = '((?:meng)|(?:peng))[e]{1}';

if (regexp(nonDasar,sKhusus))
  xDasar = regexprep(nonDasar,sKhusus,'');
  xDasar = Akhiran(xDasar,kDasar);
else
  xDasar = nonDasar;
end

cmp0 = strcmp(xDasar,kDasar);
if (cmp0 == 0)
   cmp1 = strcmp(nonDasar,kDasar);
   if (cmp1 == 0)
      xDasar = regexprep(nonDasar,'\<((?:di)|(?:ke)|(?:se)|(?:ny))','');
   end
    
   cmp2 = strcmp(xDasar,kDasar);
   if (cmp2 == 0)
       if (regexp(xDasar,'\<(?:be)'))
           if (regexp(xDasar,'\<(r)'))
               xDasar = regexprep(xDasar,'\<(r)','');
           elseif (regexp(xDasar,'\<(?:ber)'))
               xDasar = regexprep(xDasar,'\<(?:ber)','');
           end
       end
   end

   cmp3 = strcmp(xDasar,kDasar);
   if (cmp3 == 0)
       if (regexp(xDasar,'\<(?:te)'))
          xDasar = regexprep(xDasar,'\<(?:te)','');
          cmp3b = strcmp(xDasar,kDasar);
          if (cmp3b == 0)
              xDasar = regexprep(xDasar,'\<(r)','');
              cmp3a = strcmp(xDasar,kDasar);
              if (cmp3a == 0)
                  xDasar = strcat('r',xDasar);
              end
          end       
       end
   end

   cmp4 = strcmp(xDasar,kDasar);
   if (cmp4 == 0)
       if (regexp(xDasar,'\<(?:pe)'))
           xDasar = regexprep(xDasar,'\<(?:pe)','');
           cmp4a = strcmp(xDasar,kDasar);
           if (cmp4a == 0)
               if (regexp(xDasar,'\<(l)'))
                   xDasar = regexprep(xDasar,'\<(l)','');
               elseif (regexp(xDasar,'\<(r)'))
                   xDasar = regexprep(xDasar,'\<(r)','');
               elseif (regexp(xDasar,'\<(m)'))
                   xDasar = regexprep(xDasar,'\<(m)','p');
                   cmp4b = strcmp(xDasar,kDasar);
                   if (cmp4b == 0)
                       xDasar = regexprep(xDasar,'\<(p)','');
                   end
               elseif (regexp(xDasar,'\<(n)'))
                   xDasar = regexprep(xDasar,'\<(n)','t');
                   cmp4c = strcmp(xDasar,kDasar);
                   if (cmp4c == 0)
                      xDasar = regexprep(xDasar,'\<(t)',''); 
                   end
                   if (regexp(xDasar,'\<(g)'))
                       xDasar = regexprep(xDasar,'\<(g)','');
                       cmp4d = strcmp(xDasar,kDasar);
                       if (cmp4d == 0)
                          xDasar = strcat('k',xDasar);
                          cmp4e = strcmp(xDasar,kDasar);
                          if (cmp4e == 0)
                              xDasar = regexprep(xDasar,'\<(k)','');
                          end
                       end
                   elseif (regexp(xDasar,'\<(y)'))
                       xDasar = regexprep(xDasar,'\<(y)','s');
                       cmp4f = strcmp(xDasar,kDasar);
                       if (cmp4f == 0)
                           xDasar = regexprep(xDasar,'\<(s)','c');
                       end
                   end
               end
           end
       end
   end
   cmp5 = strcmp(xDasar,kDasar);
   if (cmp5 == 0)
       if (regexp(xDasar,'\<(?:me)'))
           xDasar = regexprep(xDasar,'\<(?:me)','');
           if (regexp(xDasar,'\<(m)'))
               xDasar = regexprep(xDasar,'\<(m)','p');
               cmp5a = strcmp(xDasar,kDasar);
               if (cmp5a == 0)
                   xDasar = regexprep(xDasar,'\<(p)',' ');
                   cmp5b = strcmp(xDasar,kDasar);
                   if (cmp5b == 0)
                       xDasar = regexprep(xDasar,'\<(\s)','m');
                       cmp5e = strcmp(xDasar,kDasar);
                       if (cmp5e == 0)
                           xDasar = regexprep(xDasar,'\<(m)','');
                       end
                   end
               end
           elseif (regexp(xDasar,'\<(?:ng)'))
               xDasar = regexprep(xDasar,'\<(?:ng)','');
               cmp5f = strcmp(xDasar,kDasar);
               if (cmp5f == 0)
                  xDasar = strcat('k',xDasar); 
               end
           elseif (regexp(xDasar,'\<(n)[aiueo]'))
               xDasar = regexprep(xDasar,'\<(n)','t');
               cmp5c = strcmp(xDasar,kDasar);
               if (cmp5c == 0)
                   xDasar = regexprep(xDasar,'\<(t)','');
               end
           elseif (regexp(xDasar,'\<(ny)'))
               cmp5d = strcmp(xDasar,kDasar);
               if (cmp5d == 0)
                  xDasar = regexprep(xDasar,'\<(ny)','s');  
               end
           elseif (regexp(xDasar,'\<(n)[^aiueo]'))
               xDasar = regexprep(xDasar,'\<(n)','');
           end       
       end
   end
end