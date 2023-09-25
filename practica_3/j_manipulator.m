clear all
close all
clc

syms d2 q1 q2

Px = cos(q1)*(q2 + d2);
Py = sin(q1)*(q2 + d2);


J = jacobian([Px, Py], [q1, q2])