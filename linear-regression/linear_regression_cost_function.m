function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  m = length(Y);
  Theta = Theta(2:end,1);
  # Calculez eroarea cu formula prezentata
  Error = (1/(2*m)) * sum((FeatureMatrix * Theta - Y).^2);
end
