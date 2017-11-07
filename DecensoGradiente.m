function [tta,J_hist] = DecensoGradiente(X,y,tta,alf,it,m,verbose)
%Prepara las variables a usar
J_hist = zeros(it,1);   %Incializamos en cero

%%
    for i = 1 : it
        h = X*tta;  %Vector de hipotesis
        t1 = tta(1) - alf*1/m*sum(h - y);
        t2 = tta(2) - alf*1/m*sum((h - y).*X(:,2));
        %actualizamos valores de teta
        tta(1) = t1;
        tta(2) = t2;
        %Calculamos la funcion de costo
        J_hist(i) = CalculaCosto(X,y,tta,m);
            %Imprimimos los valores iterativos
            if verbose == true
            fprintf('|It = %d | J = %f | Teta0 = %f | Teta1 = %f|\n',i,J_hist(i),t1,t2)
            end
    end
    
%%
            %Imprimimos solo el valor de J en la ultima iteracion 
            if verbose == false
            fprintf('J = %f\n',J_hist(it))
            end
            
%% Imprimiendo J contra tt0 y tta1            
% figure;
% contour(t1,t2,J_hist, logspace(-2, 2, 15))
% xlabel('\theta_0'); 
% ylabel('\theta_1');
end