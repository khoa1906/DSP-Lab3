function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    // Time vectors
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    
    // Common time range
    n_min = min(min(n1), min(n2));
    n_max = max(max(n1), max(n2));
    ny = n_min:n_max;
    
    // Zero padding and alignment
    y1 = zeros(1, length(ny));
    y2 = zeros(1, length(ny));
    y1(n1 - n_min + 1) = x1n;
    y2(n2 - n_min + 1) = x2n;
    
    // Signal addition
    yn = y1 + y2;
    yorigin = find(ny == 0);
    
    // Plot
    scf(0); clf();
    
    subplot(3,1,1);
    plot2d3(n1, x1n);
    title("Input signal x1(n)");
    xlabel("n"); ylabel("Amplitude");
    xgrid();
    
    subplot(3,1,2);
    plot2d3(n2, x2n);
    title("Input signal x2(n)");
    xlabel("n"); ylabel("Amplitude");
    xgrid();
    
    subplot(3,1,3);
    plot2d3(ny, yn);
    title("Sum signal y(n) = x1(n) + x2(n)");
    xlabel("n"); ylabel("Amplitude");
    xgrid();
endfunction

clc;

// Test script
x1n = [0, 1, 3, -2];
x1origin = 1;
x2n = [1, 1, 2, 3];
x2origin = 2;

[yn, yorigin] = add(x1n, x1origin, x2n, x2origin);

disp(yn, "yn = ");
disp(yorigin, "yorigin = ");
