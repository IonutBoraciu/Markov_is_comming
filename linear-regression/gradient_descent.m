function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  # Initializez variabile
  Theta = zeros(n+1, 1);
  X = [ones(m, 1) FeatureMatrix];
  
  # Parcurg numarul de iteratii
  for i = 1:iter
    # Calculez la fiecare pas Gradientul si Theta
    Gradient = (1/m) * X' * ((X*Theta)-Y);
    Theta = Theta - alpha * Gradient;
  endfor
  Theta(1)=0;
endfunction