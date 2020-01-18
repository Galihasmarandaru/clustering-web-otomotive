% Baca Data
function datastring = bacaData(file_XML)

fid = fopen(file_XML,'rt','native','UTF-8');
datastring = fscanf(fid,'%c',inf);
fclose(fid);