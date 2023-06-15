function [J, grad] = cost_function(params, X, y, lambda, input_layer_size, hidden_layer_size, output_layer_size)
  
  % Redimensionarea vectorilor Theta1 si Theta2
  Theta1 = reshape(params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
  
  Theta2 = reshape(params((1 + (hidden_layer_size * (input_layer_size + 1))):end), output_layer_size, (hidden_layer_size + 1));
  %Initializarea elementelor
  m = size(X, 1);
  Y = eye(output_layer_size)(y,:);
  %Vectorul activarilor neuronale
  a1 = [ones(m, 1) X];
  %Rezultate intermediare
  z2 = a1 * Theta1';
  %Aplicarea vectorizata a functiei de alplicare
  a2 = [ones(size(z2, 1), 1) sigmoid(z2)];
  z3 = a2 * Theta2';
  Theta1 = Theta1(:,2:end);
  Theta2 = Theta2(:,2:end);
  % Aplic formula pentru a calcula costul, formula care se bazeaza
  % pe cross-entropy
  J1 = (1/m) * sum(sum((-Y .* log(sigmoid(z3))) - ((1 - Y) .* log(1 - sigmoid(z3)))));
  J2 = (lambda / (2 * m)) * (sum(sum(Theta1 .^ 2)) + sum(sum(Theta2 .^ 2)));
  J = J1 + J2;

  % Aplic formulele finale pentru a calcula Theta

  Theta1_2 = (1 / m) * ((((sigmoid(z3)-Y) * Theta2) .* sigmoid(z2) .* (1 - sigmoid(z2)))' * a1);
  Theta2_2 = (1 / m) * ((sigmoid(z3)-Y)' * a2);
  Theta1_2(:, 2:end) = Theta1_2(:, 2:end) + ((lambda / m) * Theta1);
  Theta2_2(:, 2:end) = Theta2_2(:, 2:end) + ((lambda / m) * Theta2);

  % Aplic formula finala

  grad = [Theta1_2(:); Theta2_2(:)];
end