function [yn, yorigin] = fold(xn, xorigin)
    // Fold operation: y(n) = x(-n)
    yn = xn($:-1:1);
    yorigin = length(xn) - xorigin + 1;
    
    // Time vector
    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;
    
    // Plot
    scf(0); clf();
    
    subplot(2,1,1);
    plot2d3(nx, xn);
    title("Input signal x(n)");
    xlabel("n"); ylabel("Amplitude");
    xgrid();
    
    subplot(2,1,2);
    plot2d3(ny, yn);
    title("Folded signal y(n) = x(-n)");
    xlabel("n"); ylabel("Amplitude");
    xgrid();
endfunction

clc;

// Test script
xn = [1, -2, 3, 6];
xorigin = 3;

[yn, yorigin] = fold(xn, xorigin);

disp(yn, "yn = ");
disp(yorigin, "yorigin = ");
