function [decoded_path] = decode_path (path, lines, cols)
  # Preiau dimensiunile variabilei path
  [n m]=size(path);
  
  # Initializez decoded_path cu zerouri
  decoded_path=zeros(n-1,2);
  
  #parcurg elementele din path pentru a le decodifica
  for i=1:n-1
   decoded_path(i,1)=floor((path(i)-1)/cols)+1;
   decoded_path(i,2)=mod(path(i),cols);
   if decoded_path(i,2)==0
     decoded_path(i,2)=cols;
   endif
  endfor
endfunction