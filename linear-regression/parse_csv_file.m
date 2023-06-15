function [Y, InitialMatrix] = parse_csv_file(file_path)
  fid = fopen(file_path);
  # Citesc header-ul din fisierul csv
  line=fgetl(fid);

  # Incep sa citesc elementele linie cu linie
  line=fgetl(fid);

  # Incrementez numarul de linii citite
  counter=1;
  
  # Citesc cat timp gasesc o linie
  while line!=-1
    # Dau split la linie in functie de ,
    v = strsplit (line, ',');
    InitialMatrix(counter,1:13)=v;
    # Citesc urmatoarea linie
    line=fgetl(fid);
    counter++;
  endwhile
  
  # Transform prima coloana in elemente de tip numeric
  Z = InitialMatrix(:,1);
  for i =1:counter-1
    num = str2num(Z{i,1});
    Y(i)=num;
  endfor
  Y=Y';
  # Elimin prima coloana
  InitialMatrix=InitialMatrix(1:end,2:end);
  fclose(fid);
end