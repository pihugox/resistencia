%limpaindo
clear;
clc;
close ALL;

fprintf('Ejemplo\n');

%%obteniendo la ubibacion de los nudos
b=input('Ingrese b : ');
a=input('Ingrese a : ');

%%con esto construimos las coordenadas de los puntos A,B,C
A = [b;a];
B = [0;0];
C = [b;0];

%%Obteniendo la carga P
Px=input('Ingrese Px : ');
Py=input('Ingrese Py : ');

%%Area transversal de las barras
ATab = input('Area transversal de la barra AB : ');
ATbc = input('Area transversal de la barra BC : ');

%%Esfuerzos admisibles de las barras
Sab = input('Esfuerzo admisible de la barra AB : ');
Sbc = input('Esfuerzo admisible de la barra BC : ');

theta = atan(a/b);

Fab = Py / sin(theta);
Fbc = Fab*cos(theta) + Px;

%%Calculando esfuerzos (? no estoy seguro de la formula)
SNab = Fab / ATab;
SNbc = Fbc / ATbc;

%%Salida del programa

%%Iprimiendo datos de entrada
fprintf('\n');
fprintf('-----------------------Datos----------------------\n');
fprintf('Punto A : [%f %f]\n',A);
fprintf('Punto B : [%f %f]\n',B);
fprintf('Punto C : [%f %f]\n',C);
fprintf('Carga P : [%f %f]\n',[Px;Py]);
fprintf('Area transversal barra AB : %f\n',ATab);
fprintf('Area transversal barra BC : %f\n',ATbc);
fprintf('Esfuerzo admisible de la barra AB : %f\n',Sab);
fprintf('Esfuerzo admisible de la barra BC : %f\n',Sbc);
fprintf('----------------------------------------------------\n');

%%Iprimiendo los esfuerzos normales
fprintf('\n');
fprintf('-----------------------Resultados----------------------\n');
fprintf('Esfuerzo normal de la barra AB : %f\n',SNab);
fprintf('Esfuerzo normal de la barra BC : %f\n',SNbc);
fprintf('----------------------------------------------------\n');

%Dibujo
figure;

hold on;
plot([0;A(1)], [0;A(2)],'b');
plot(A(1), A(2),'ok')

hold on;
plot([0;C(1)], [0;C(2)],'b');
plot(C(1), C(2),'ok')

title('Ejemplo')
  xlabel('x (m)');ylabel('y (m)');

xmin=min([0;A]); xmax=max([0;C]);
ymin=min([0;A]); ymax=max([0;C]);
axis([xmin-1 xmax+1 ymin-1 ymax+1]);

amP=sqrt(Px^2+Py^2);
quiver (0,0,Px/amP,Py/amP,'r');
grid on

