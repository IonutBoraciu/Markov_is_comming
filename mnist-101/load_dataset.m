function [X, y] = load_dataset(path)
  fid = fopen(path, 'r');
  # Folosesc functia load pentru a incarca in memorie
  # Matricele din fiserul .mat
  load(path);
  fclose(fid);
endfunction
