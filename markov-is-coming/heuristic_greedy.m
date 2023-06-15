function [path] = heuristic_greedy(start,probabilities,adjacency)
 # Initializez elementele care urmeaza sa fie folosite
  n = size(adjacency,1);
  nr_elem=0;
  visited=zeros(1,n-2);
  prob_max=0;
  maxpos=0;
  
  # Initializez drept vizitat pozitia de start si o adaug in vectorul path
  visited(start)=1;
  path(1,1) = start;
  
  # Incep parcurgerea pentru a gasi drumul catre calea WIN
  for i=1:n-2
   
    # Incrementez numarul de elemente din vectorul PATH
    nr_elem++;
    
    # Calculez elementul cu cea mai mare probabilitate care NU a fost vizitat
    for j=1:n-2
      # Verific ca elementul sa nu fie vizitat si sa existe muchia
      if visited(j)==0 && adjacency(start,j)==1
         # Calculez elementul cu cea mai mare probabilitate de a ajunge la WIN
         if probabilities(j) > prob_max
         prob_max=probabilities(j);
         maxpos=j;
         endif
      endif
    endfor
    # Verific daca am muchie care WIN din nodul curent
    if adjacency(start,n-1)==1
      # In caz afirmativ adaug in vectorul path ultimul element si opresc
      # executia functiei, intrucat am gasit drumul cautat
      path(1,i+1)=n-1;
      path=path';
      return
    endif
    # Updatatez elementele pentru nodul nou gasit ( cu probabilitatea cea mai mare)
    start=maxpos;
    visited(start)=1;
    path(1,i+1)=start;
    # Reinitializez variabilele pentru urmatoarea rulare
    prob_max=0;
    maxpos=0;
    endfor
endfunction
