function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  m = length(Y);
  Theta = Theta(2:end,1);
  # Aplic formula de la lasso_regression
  Error = (1/m)*sum((Y-FeatureMatrix*Theta).^2)+lambda*norm(Theta,1);
endfunction