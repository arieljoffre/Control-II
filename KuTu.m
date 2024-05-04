% Parámetros de la planta
La = 0.5;  % Henrios
J = 0.08;  % Kg*m^2
B = 0.2;   % N*m*s/rad
If = 0.02; % Amperios
Kt = 0.45; % Nm/A
Kv = 0.45; % V*s/m

% Definir la función de transferencia continua del sistema
s = tf('s');
Gs = (If * Kt) / (J*s^2 + (B+La)*s + (Kt*Kv));

% Estimación de parámetros PID
Ku = 0.6 * Kt;  % Ganancia última aproximada
Tu = 2 * La;    % Período de oscilación aproximado
disp(['Ku: ', num2str(Ku), ' Nm/A']);  % Mostrar Ku
disp(['Tu: ', num2str(Tu), ' segundos']);  % Mostrar Tu

% Cálculos de constantes PID basados en Ziegler-Nichols
Kp = 0.6 * Ku;
Ki = 2 * Kp / Tu;
Kd = Kp * Tu / 8;

% Crear controlador PID
C = pid(Kp, Ki, Kd);

% Sistema en lazo cerrado
T = feedback(C*Gs, 1);

% Respuesta al escalón del sistema en lazo cerrado
figure;
step(T, 0:0.01:50);
title('Respuesta del Sistema en Lazo Cerrado con PID');
grid on;
