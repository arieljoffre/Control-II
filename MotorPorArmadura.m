clear;
clc;
close all;

% Definir los parámetros del sistema
La = 0.5;  % Henrios
J = 0.08;  % Kg*m^2
B = 0.2;   % N*m*s/rad
If = 0.02; % Amperios
Kt = 0.45; % Nm/A
Kv = 0.45; % V*s/m

% Numerador y denominador de la función de transferencia
num = [If * Kt];
den = [La * J, La * B + J, B + Kv * If^2 * Kt];

% Crear la función de transferencia
G = tf(num, den);

% Definir el vector de tiempo y la entrada que cambia
t = 0:0.01:20; % tiempo de 0 a 20 segundos
u = 5 * ones(size(t)); % entrada inicial de 5V
u(t >= 5) = 6; % cambia a 6V a los 5 segundos

% Simular la respuesta del sistema a la nueva entrada
[y, t, x] = lsim(G, u, t);

% Graficar la respuesta
figure;
plot(t, u, 'r--', 'LineWidth', 2); hold on; % Gráfico de la entrada
plot(t, y, 'b-', 'LineWidth', 2); % Gráfico de la respuesta del sistema
xlabel('Tiempo (s)');
ylabel('Respuesta del Sistema (rad/s)');
title('Respuesta del Sistema a un Cambio Súbito en la Entrada de Voltaje');
legend('Entrada de Voltaje', 'Respuesta del Sistema');
grid on;
