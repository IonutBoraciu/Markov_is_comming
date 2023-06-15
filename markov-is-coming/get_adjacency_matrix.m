function [Adj] = get_adjacency_matrix(Labyrinth)
  n = size(Labyrinth, 1);
  m = size(Labyrinth, 2);

  # Dimensiunea reala a matricei de adiacenta

  num_nodes = n*m + 2;
  # Initializeaza matricea rara cu functia sparse

  Adj = sparse(num_nodes, num_nodes);
  # Setez nodurile de win si lose pe diagonala principala cu 1

  Adj(num_nodes-1, num_nodes-1)=1;
  Adj(num_nodes, num_nodes)=1

  # Incepe parcurgea matricei
  for i = 1:n
    for j = 1:m
      # Indexul cu care este apelata matricea de adiacenta
      idx = (i-1)*size(Labyrinth, 2) + j;
      
      # Verific daca am stare de WIN
      if bitand(Labyrinth(i,j), 8) == 0 && i == 1
        Adj(j, num_nodes-1) = 1;
      elseif bitand(Labyrinth(i,j), 4) == 0 && i == n
        Adj(idx, num_nodes-1) = 1;
      endif

      # Verific daca am stare de LOSE
      if bitand(Labyrinth(i,j), 2) ==0 && j == m
        Adj(idx,num_nodes)=1;
      endif
      if bitand(Labyrinth(i,j),1)==0 && j==1
        Adj(idx,num_nodes)=1;
      endif

      # Verific daca exista muchie care nodul de deasupra
      if bitand(Labyrinth(i,j), 8) == 0 && i > 1
        Adj(idx, idx-m) = 1;
      endif

      # Verific daca exista muchie care nodul de dedesubt
      if bitand(Labyrinth(i,j), 4) == 0 && i < n
        Adj(idx, idx+m) = 1;
      endif

      # Verific daca exista muchie care nodul din dreapta
      if bitand(Labyrinth(i,j), 2) == 0 && j < m
        Adj(idx, idx+1) = 1;
      endif

      # Verific daca exista muchie care nodul din stanga
      if bitand(Labyrinth(i,j), 1) == 0 && j > 1
        Adj(idx, idx-1) = 1;
      endif
      endfor
    endfor
  end