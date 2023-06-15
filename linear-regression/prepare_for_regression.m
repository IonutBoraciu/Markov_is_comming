
function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  [m n]= size(InitialMatrix);
  m = size(InitialMatrix(:,1));
  
  # Initializez elementele cu o coloana in plus pt elementele furnished care au nevoie
  # de 2 coloane
  FeatureMatrix=zeros(m,n+1);
  
  # Parcurg elementele din matricea InitialMatrix
  for i=1:m
    for j=1:n
      # Verific daca se intampla ca pe ultima coloana NU am elemente de tipul furnished
      if j==n
        if strcmp(InitialMatrix{i,j},'semi-furnished')==0 && strcmp(InitialMatrix{i,j},'unfurnished')==0 &&strcmp(InitialMatrix{i,j},'furnished')==0
          # Convertesc elementul la tipul numeric
          num = str2num(InitialMatrix{i,j});
          FeatureMatrix(i,j+1)=num;
          continue;
        endif
      endif
      # Verific daca am string-ul yes, caz in care adaug 1 matrice
      if strcmp(InitialMatrix{i,j},'yes')==1
        FeatureMatrix(i,j)=1;
      # Adaug 1 daca intalnesc sirul 'semi-furnished'
      elseif strcmp(InitialMatrix{i,j},'semi-furnished')==1
        FeatureMatrix(i,j)=1;
      # Adaug 1 pe urmatoarea coloana pt sirul 'unfurnished'
      elseif strcmp(InitialMatrix{i,j},'unfurnished')==1
        FeatureMatrix(i,j+1)=1;
      # Adaug 0 pe urmatoarea coloana daca intalnesc 'no'
      elseif strcmp(InitialMatrix{i,j},'no')==1
        FeatureMatrix(i,j+1)=0;
      else
        # Daca nu am intrat in alt if atunci convertesc elementul la tipul numeric
        num= str2num(InitialMatrix{i,j});
        if isnan(num)==0
        FeatureMatrix(i,j)=num;
        endif
      endif
    endfor
  endfor
endfunction