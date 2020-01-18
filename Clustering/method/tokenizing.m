% ambil Term
function sKata = tokenizing(datastring)

cond_1 = '(<body.*?>)(.*?)</body>';

% hapus script, footer, nav, img, ul, li, table, a, style
cond_2 = ['(<script.*?>)(.*?)</script>|'...
          '(<li.*?>)(.*?)</li>|'...
          '(<footer.*?>)(.*?)</footer>|'...
          '(<nav.*?>)(.*?)</nav>|'...
          '(<img.*?>)(.*?)</img>|'...
          '(<ul.*?>)(.*?)</ul>|'...
          '(<table.*?>)(.*?)</table>|'...
          '(<style.*?>)(.*?)</style>|'...
          '(<ol.*?>)(.*?)</ol>|'...
          '(<a.*?>)(.*?)</a>|'...
          '(\<<!--)(.*?)(-->\>)'];
      
cond_4 = '<(\w+).*?>|</(\w+).*?>'; % untuk hapus yang ada taggingnya <>
cond_5 = '([^-\w\s]+)'; % untuk pisahkan kata dengan selain kata

% ambil body {}
dataBody = regexp(datastring,cond_1,'tokens'); % Ambil bagian body

dataBodyNew = regexprep(dataBody{1}{2},'\s+',' '); % Semua yang mengandung spasi > 1 dihapus, diganti 1 spasi dan dibuat 1 baris

dataBodyNew2 = regexprep(dataBodyNew,cond_2, ''); % Tagging tertentu dihapus

% if regexp(dataBodyNew2,cond_3)
newData = strtrim(regexprep(dataBodyNew2,cond_4,''));

newData2 = regexprep(lower(newData),cond_5,' $1 ');


if regexp(newData2,'(([a-z]+)([-])([a-z]+)|\<(tidak|bukan|ngk|nggak|ngggak|gak|ndak)(\s)(\w*))')

 newData3 = regexp(newData2,'(([a-z]+)([-])([a-z]+)|\<(tidak|bukan|ngk|nggak|ngggak|gak|ndak)(\s)(\w*)|([a-z]+))','match');
 newData3 = regexprep(newData3,'\<(\w+)(-)',''); % Kata berulang
 newData3 = regexprep(newData3,'\s',''); % Negasi

 newToken = newData3';
else
 newData3 = regexp(newData2,'([a-z]+)','match');
 newToken = newData3';
end

sKata = synKata(newToken);

