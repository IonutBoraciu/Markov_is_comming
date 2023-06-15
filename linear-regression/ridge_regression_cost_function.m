function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  m = length(Y);
  Theta = Theta(2:end,1);
  # Aplic formula de la ridge_regression
  Error = (1/(2*m))*sum((FeatureMatrix * Theta -Y).^2)+lambda*sum(Theta.^2);
endfunction