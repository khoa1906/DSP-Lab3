function [yn, yorigin] = delay(xn, xorigin, k)
    // Delay operation: y(n) = x(n - k)
    yn = xn;
    yorigin = xorigin - k;
    
    // Time axis
    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;
    
    // Plot
    scf(0); clf();
    
    subplot(2,1,1);
    plot2d3(nx, xn);
    title("Input x(n)");
    xlabel("n"); ylabel("x(n)");
    xgrid();
    
    subplot(2,1,2);
    plot2d3(ny, yn);
    title(msprintf("Delayed y(n) = x(n - %d)", k));
    xlabel("n"); ylabel("y(n)");
    xgrid();
endfunction

clc;

// Test data
xn = [1, -2, 3, 6];
xorigin = 3;
k = 1;

[yn, yorigin] = delay(xn, xorigin, k);

disp("Tin hieu yn:");
disp(yn);
disp("Vi tri goc yorigin:");
disp(yorigin);
