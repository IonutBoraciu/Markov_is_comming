function [Adj] = get_link_matrix(Labyrinth)
  n = size(Labyrinth, 1);
  m = size(Labyrinth, 2);
  # Dimensiunea reala a matricei de adiacenta
  num_nodes = n*m + 2;

  # Initializez matricea drept o matrice sparse
  Adj = sparse(num_nodes, num_nodes);
  Adj(num_nodes-1, num_nodes-1)=1;
  Adj(num_nodes, num_nodes)=1

  # Creez un vector in care sa numar cate elemente am 
  # pe o linie a matricei Adj
  num_edges=zeros(num_nodes,1);

  # Parcurg matricea de adiacenta
  for i = 1:n
    for j = 1:m
      idx = (i-1)*m + j;
      pos=0;

      # Verific daca am muchie care WIN
      if bitand(Labyrinth(i,j), 8) == 0 && i == 1
        Adj(idx, num_nodes-1) = sparse(1);
        num_edges(idx)=num_edges(idx)+1;
      elseif bitand(Labyrinth(i,j), 4) == 0 && i == n
        Adj(idx, num_nodes-1) = sparse(1);
        num_edges(idx)=num_edges(idx)+1;
      endif

      # Verific daca am muchie care LOSE
      if bitand(Labyrinth(i,j), 2) ==0 && j == m
        Adj(idx,num_nodes)=sparse(1);
         num_edges(idx)=num_edges(idx)+1;
      endif
      if bitand(Labyrinth(i,j),1)==0 && j==1
        Adj(idx,num_nodes)=sparse(1);
        num_edges(idx)=num_edges(idx)+1;
      endif

      # Verific daca am muchie care nodul de deasupra
      if bitand(Labyrinth(i,j), 8) == 0 && i > 1
        Adj(idx, idx-m) = sparse(1);
        num_edges(idx)=num_edges(idx)+1;
      endif

      # Verific daca am muchie care nodul de dedesubt
      if bitand(Labyrinth(i,j), 4) == 0 && i < n
        Adj(idx, idx+m) = sparse(1);
        num_edges(idx)=num_edges(idx)+1;
      endif

      # Verific daca am muchie care nodul din dreapta
      if bitand(Labyrinth(i,j), 2) == 0 && j < m
        Adj(idx, idx+1) = sparse(1);
        num_edges(idx)=num_edges(idx)+1;
      endif

      # Verific daca am muchie care nodul din stanga
      if bitand(Labyrinth(i,j), 1) == 0 && j > 1
        Adj(idx, idx-1) = sparse(1);
         num_edges(idx)=num_edges(idx)+1;
      endif
      endfor
    endfor
    # Impart fiecare element de pe fiecare linie cu numarul de elemente
    # de pe linia respectiva ( daca numarul de elemente !=0)
    for i = 1:num_nodes
      if(num_edges(i)!=0)
        Adj(i,:)=Adj(i,:)/num_edges(i);
      endif
    endfor
endfunction