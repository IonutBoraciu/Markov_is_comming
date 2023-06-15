function [Y, InitialMatrix] = parse_data_set_file(file_path)
  fid = fopen(file_path, 'r');
  # Citesc numarul de linii si de coloane
  data = textscan(fid, '%d %d', 1);
  n = data{1};
  m = data{2};

  # Initializez matricea cu tipul cell ( are atat numere cat si string-uri)
  InitialMatrix=cell(n,m+1);
  Y =zeros(n,1);

  # Citesc fiecare linie pe rand si o impart dupa delimitatorul ' ' 
  for i=1:n
    line=fgetl(fid);
    v = strsplit (line, ' ');
    InitialMatrix(i,1:m+1) = v;
  endfor
  
  # Transform prima coloana din matrice in elemente de tip numeric
  # Pentru a completa matricea Y
  Z = InitialMatrix(:,1);
  for i =1:n
    num = str2num(Z{i,1});
    Y(i)=num;
  endfor
  
  # Elimin prima coloana din matricea initiala
  InitialMatrix=InitialMatrix(1:end,2:end);
  fclose(fid);
end