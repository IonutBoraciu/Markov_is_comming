function [classes] = predict_classes(X, weights, input_layer_size, hidden_layer_size, output_layer_size)
 m = size(X,1);
 # Dau resize la variabilele Theta1 si Theta2
 Theta1 = reshape(weights(1:hidden_layer_size * (input_layer_size +1)), hidden_layer_size,(input_layer_size+1));
 Theta2 =reshape(weights((1+hidden_layer_size *(input_layer_size+1)):end),output_layer_size,(hidden_layer_size+1));
 # Aplic algoritmul de forward propagation prezentat in enuntul temei
 a1 = [ones(m,1) X];
 z2 = a1*Theta1';
 a2 = [ones(size(z2,1),1) sigmoid(z2)];
 # Ii atribui lui classes maximul de fiecare linie
 [~,classes] = max(sigmoid(a2*Theta2'),[],2);

endfunction
