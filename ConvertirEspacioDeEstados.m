% Parámetros del sistema
La = 0.5;   % Henrios
J = 0.08;   % Kg-m^2
B = 0.2;    % Nm/s/rad
If = 0.02;  % Amperios
Kt = 0.45;  % Nm/A
Kv = 0.45;  % V*s/m

% Coeficientes del denominador
a = La * J;                     % Coeficiente de s^2
b = La * B + J;                 % Coeficiente de s
c = B + Kv * If^2 * Kt;         % Término constante

% Numerador y denominador de la función de transferencia
num = [If * Kt];
den = [a b c];

% Creación de la función de transferencia
Gs = tf(num, den);

% Convertir a espacio de estados
sys = ss(Gs);

% Mostrar las matrices A, B, C y D
disp('Matriz A:');
disp(sys.A);
disp('Matriz B:');
disp(sys.B);
disp('Matriz C:');
disp(sys.C);
disp('Matriz D:');
disp(sys.D);
