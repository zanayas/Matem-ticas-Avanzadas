function J = CalculaCosto(X,y,tta,m)
%%
%Calcula la matriz de hipotesis (vector)
h = X*tta;  %vectorizacion: más eficiente que un loop, simplemente calculamos
            ...el vector de hipotesis multiplicando cada fila en la matriz de
            ...los ejemplos por el vector columna teta
%Calcula el costo
J = 1/(2*m)*sum((h - y)).^2;

end