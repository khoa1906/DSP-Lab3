// Lab 3 - Bai 6
function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    Nx = length(xn);
    Nh = length(hn);
    yn = zeros(1, Nx + Nh - 1);

    // Tinh tich chap theo tung cap phan tu
    for i = 1:Nx
        for j = 1:Nh
            yn(i + j - 1) = yn(i + j - 1) + xn(i) * hn(j);
        end
    end

    // Vi tri n = 0 cua tin hieu dau ra
    yorigin = xorigin + horigin - 1;
endfunction

clc;
scf(0);
clf();

// Du lieu vi du
xn = [1 2 1];
xorigin = 2;
hn = [1 -1 2];
horigin = 1;

[yn, yorigin] = convolution(xn, xorigin, hn, horigin);

disp("Tin hieu yn:");
disp(yn);
disp("Vi tri goc yorigin:");
disp(yorigin);

// Truc thoi gian cua tung tin hieu
nx = (1:length(xn)) - xorigin;
nh = (1:length(hn)) - horigin;
ny = (1:length(yn)) - yorigin;

subplot(3,1,1);
plot2d3(nx, xn);
title("Input signal x(n)");
xlabel("n");
ylabel("x(n)");
xgrid();

subplot(3,1,2);
plot2d3(nh, hn);
title("System signal h(n)");
xlabel("n");
ylabel("h(n)");
xgrid();

subplot(3,1,3);
plot2d3(ny, yn);
title("Convolution y(n) = x(n) * h(n)");
xlabel("n");
ylabel("y(n)");
xgrid();
