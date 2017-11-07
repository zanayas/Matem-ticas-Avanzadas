%% Limpiamos y Cargamos los datos
clear all; close all; clc;
x = load('ex2x.dat');   %edad
y = load ('ex2y.dat');  %altura

%% Definimos las variables necesarias
m = length(y);  %obtenemos el tamaño de y
tta = zeros(2,1);   %valores iniciales de los parametros
it = 1500;  %numero de iteraciones necesarias para el decenso del gradiente
alf = 0.08; %paso grande
%alf = 0.07; %paso correcto

%% Calculando la funcion de costo
X = [ones(m, 1), x];    % Agregando columna de unos a x
%VARIABLE "VERBOSE": Muestra la todos los datos de iterativos
verbose = true;
%VARIABLE "DISPLAY": Muestra la recta ajustada
display = true; 
%J = CalculaCosto(X,y,tta)

%% Corre el decenso del gradiente
[tta,J_hist] = DecensoGradiente(X,y,tta,alf,it,m,verbose);

%% Imrime los ejemplos
figure(1)   %abre una ventana de figura
hold on
plot(x,y,'bx','Linewidth',1.2);  %Imprimir en pantalla x y
ylabel('Altura [m]','Interpreter','latex','FontSize',16,'FontName','Times New Roman');
xlabel('Edad [a\~nos]','Interpreter','latex','FontSize',16,'FontName','Times New Roman');
set(gca,'fontsize',12)  %tamaño de numeros en ejes
    
%% Imprimiento el la linea del la regresion lineal
    if display == true
    %Variables auxiliares
    a1 = X(:,2);
    a2 = X*tta;
%   for i=1:it
%   hold on
    f1 = figure(1);
    plot(a1,a2,'r')
%       plot(a1(i),a2(i),'r')
%       pause(0.01);
%       end
    %Crear legenda
    l1 = legend('Ejemplos','Regresi${\rm \acute{o}}$n','Location','SouthEast','Orientation','vertical');
    set(l1,'Interpreter','latex','FontSize',12,'FontName','Times New Roman');
    %legend boxoff;
    comet(a1,a2);
    drawnow;
    hold off;
    end 
    
%% Graficando la funcion de costo para cada iteracion
figure(2)
plot(1:it,J_hist,'-b');
%Crear legenda
ylabel('Funcion de costo $J(\theta)$','Interpreter','latex','FontSize',16,'FontName','Times New Roman');
xlabel('No. de Iteraciones','Interpreter','latex','FontSize',16,'FontName','Times New Roman');
set(gca,'fontsize',12)  %tamaño de numeros en ejes

%% Obteniendo eps
% print -f1  -depsc Regresion.eps