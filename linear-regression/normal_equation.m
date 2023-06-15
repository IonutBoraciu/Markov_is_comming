function [Theta] = conjugate_gradient(FeatureMatrix, Y, tol, iter)
  A = FeatureMatrix' * FeatureMatrix;
  b = FeatureMatrix' * Y;
  [m, n] = size(FeatureMatrix);
  # Verific ca matricea sa fie pozitiv definita
  # Daca NU este atunci afisez 0 si opresc executia
  if any(eig(A) <= 0)
    Theta=zeros(n+1,1);
    return;
  endif
  
  # Initializez elementele
  x = zeros(n, 1);
  r = b - A * x;
  v = r;
  tol_squared = tol^2;
  k = 1;
  
  # Incep parcurgea cat timp conditia asta indeplinita
  while k <= iter && r' * r > tol_squared
    
    # Aplic formulele din algoritmul prezentat in tema
    t(k) = r' * r / (v' * A * v);
    x = x + t(k) * v;
    r_next = r - t(k) * A * v;
    s(k) = r_next' * r_next / (r' * r);
    v = r_next + s(k) * v;
    r = r_next;
    k = k + 1;
  endwhile
  Theta=zeros(n+1,1);
  Theta(2:end,:) = x;
endfunction
