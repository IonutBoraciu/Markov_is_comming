function [Labyrinth] = parse_labyrinth(file_path)
  # Deschid fisierul primit ca argument
  fid = fopen(file_path, 'r');

  # Citesc prima linie
  line = fgetl(fid);

  # Initializez variabilele m si n
  [m, n] = sscanf(line, '%d %d');

  # Pentru a evita folosirea functiei dlmread, intrucat nu este stabila
  # voi citii fiecare linie pe rand si o voi sparge in functie de spatiu
  # apoi voi converti elementele la tipul intreg
  for i = 1:m(1)
    line = fgetl(fid);
    v = strsplit(line,' ');
    for j =1:m(2)
      Labyrinth(i,j) = str2num(v{j});
     endfor
  endfor
  # Inchid fisierul
  fclose(fid);
endfunction
