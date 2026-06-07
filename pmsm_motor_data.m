%% PMSM Motor Data
clear; clc;

%% ==============================
%  BASIC MOTOR PARAMETERS
%  ==============================
motor.type = 'IPMSM';          % 'SPMSM' or 'IPMSM'
motor.P_rated = 2.2e3;         % Rated power [W]
motor.V_ll_rated = 230;        % Rated line-line RMS voltage [V]
motor.I_rated = 10;            % Rated RMS current [A]
motor.f_rated = 100;           % Rated electrical frequency [Hz]
motor.n_rated_rpm = 1500;      % Rated mechanical speed [rpm]

%% ==============================
%  ELECTRICAL PARAMETERS
%  ==============================
motor.Rs = 0.45;               % Stator resistance [ohm]
motor.Ld = 8.5e-3;             % d-axis inductance [H]
motor.Lq = 14e-3;              % q-axis inductance [H]
motor.lambda_pm = 0.175;       % PM flux linkage [Wb]

%% ==============================
%  POLE / SPEED DATA
%  ==============================
motor.poles = 8;               % Total number of poles
motor.pp = motor.poles/2;      % Pole pairs

motor.omega_m_rated = 2*pi*motor.n_rated_rpm/60;    % mech speed [rad/s]
motor.omega_e_rated = motor.pp * motor.omega_m_rated; % elec speed [rad/s]

%% ==============================
%  MECHANICAL PARAMETERS
%  ==============================
motor.J = 0.0025;              % Rotor inertia [kg.m^2]
motor.B = 0.0002;              % Viscous friction coefficient [N.m.s/rad]

%% ==============================
%  INVERTER / CONTROL PARAMETERS
%  ==============================
motor.Vdc = 400;               % DC bus voltage [V]
motor.fsw = 10e3;              % Switching frequency [Hz]
motor.Ts = 1/motor.fsw;        % Control sample time [s]

% Approx max stator voltage magnitude for SVPWM
motor.Vmax = motor.Vdc/sqrt(3); 

%% ==============================
%  DERIVED TORQUE CONSTANT
%  ==============================
% Approx torque constant around id = 0
motor.Kt_id0 = 1.5 * motor.pp * motor.lambda_pm;   % [N.m/A]

%% ==============================
%  CURRENT LIMITS
%  ==============================
motor.I_peak = sqrt(2)*motor.I_rated;      % peak current [A]
motor.Imax = motor.I_peak;                 % max current magnitude [A]

%% ==============================
%  BASE SPEED ESTIMATE
%  ==============================
% Rough estimate for base electrical speed:
motor.omega_base_e = motor.Vmax / motor.lambda_pm;      % [rad/s]
motor.omega_base_m = motor.omega_base_e / motor.pp;     % [rad/s]
motor.n_base_rpm = motor.omega_base_m * 60/(2*pi);      % [rpm]

%% ==============================
%  DISPLAY
%  ==============================
disp('------ PMSM MOTOR DATA ------');
disp(motor);
fprintf('Rated mechanical speed  = %.2f rad/s\n', motor.omega_m_rated);
fprintf('Rated electrical speed  = %.2f rad/s\n', motor.omega_e_rated);
fprintf('Approx torque constant  = %.4f N.m/A\n', motor.Kt_id0);
fprintf('Approx base speed       = %.2f rpm\n', motor.n_base_rpm);
fprintf('Max inverter voltage    = %.2f V\n', motor.Vmax);