clear all; close all; clc,
% Example from https://www.mathworks.com/help/control/ref/place.html
% Define system
A = [-1,-2;1,0];
B = [2;0];
C = [0,1];
D = 0;
sys = ss(A,B,C,D);
% Get poles
Pol  = pole(sys)
% check step response
figure(1)
step(sys)
hold on;
% desired poles due to underdamped
p = [-1,-2];
% Find the gain matrix K using pole placement and check the closed-loop poles of syscl.
K = place(A,B,p);
Acl = A-B*K;
syscl = ss(Acl,B,C,D);
Pcl = pole(syscl)
% step response
figure(1)
step(syscl)
hold on;
% desired poles 2 due to underdamped
p = [-2,-3];
% Find the gain matrix K using pole placement and check the closed-loop poles of syscl.
K = place(A,B,p);
Acl = A-B*K;
syscl = ss(Acl,B,C,D);
Pcl = pole(syscl)
% step response
figure(1)
step(syscl)