clear all
close all
clc

syms d1 d2 x1(t) x2(t)

J = [-sin(x1(t))*(d2 + x2(t)), cos(x1(t));
    cos(x1(t))*(d2 + x2(t)), sin(x1(t))];

Jdot = diff(J,t)