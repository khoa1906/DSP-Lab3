function [yn, yorigin] = advance(xn, xorigin, k)
    // Advance operation: y(n) = x(n + k)
    yn = xn;
    yorigin = xorigin + k;
    
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
    title(msprintf("Advanced signal y(n) = x(n + %d)", k));
    xlabel("n"); ylabel("Amplitude");
    xgrid();
endfunction

clc;

// Test script
xn = [1, -2, 3, 6];
xorigin = 3;
k = 1;

[yn, yorigin] = advance(xn, xorigin, k);

disp(yn, "yn = ");
disp(yorigin, "yorigin = ");
