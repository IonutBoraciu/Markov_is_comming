function [G, c] = get_Jacobi_parameters(Link)
  # Iau dimensiunile matricei Link
  [m,n] = size(Link);
  
  # Initializez matricea G si vectorul c ca fiind rare
  G = sparse(m,n);
  c = sparse(m,1);
  
  # Preiau parametrii lui Jacobi din matricea Link
  G = Link(1:n-2, 1:m-2);
  c = Link (1:n-2, n-1);
end