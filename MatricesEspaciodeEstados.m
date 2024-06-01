clc
clear
s = tf('s');

% Datos Motor
La = 0.5;       % (Inductancia de la armadura): 0.5 henrios
J = 0.08;       % (Inercia del rotor): 0.08 kg-m²
km = 0.01;      % (Constante del motor): 0.01 Nm/Amp
Vf = 5;         % (Fuente de alimentación): 5 voltios
Ra = 1;         % (Resistencia del campo): 1 ohmio
i_f = 20e-3;    % (Corriente del campo): 20 mA (0.02 A) 
kt = 0.45;      % (Constante de torque): 0.45 Nm/A
kv = 0.45;      % (Constante de retroalimentación de velocidad): 0.45 V·s/m
b = 0.2;        % (Coeficiente de fricción viscosa): 0.2 N·m/s/rad
Va = 5;         % Voltaje de Referencia
Tl = 0.02;

% Construcción sistema MISO (Multiple Input Single Output)
A=[0        1               0;  
   0      -b/J          i_f*kt/J;
   0   -kv*i_f/La        -Ra/La];

B=[0; 
   0; 
   1/La];

C=[0 1 0];

D=0;

sys = ss(A,B,C,D)