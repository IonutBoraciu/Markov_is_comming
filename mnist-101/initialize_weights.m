function [matrix] = initialize_weights(L_prev, L_next)
  # Calculez eroarea epsilon folosind formula data
  epsilon = sqrt(6) / sqrt(L_prev + L_next);
  # Initializez matricea in functie de eroare calculata anterior
  matrix = -epsilon +  2*epsilon*rand(L_next,L_prev+1);
endfunction