function [x,err,steps] =perform_iterative(G,c,x0,tol,max_steps)
  # Preiau numarul de linii din matricea G
  n=size(G,1);

  # Initializez variabilele
  x=x0;
  err=1;
  steps=0;

  # Incep iteratia cu un numar maxim de max_steps pasi
  while 1
    old_x = x;
    x=G*x+c;
    err=norm(x-old_x);
    if ++steps ==max_steps || err<tol
        return;
    endif
 endwhile
 endfunction