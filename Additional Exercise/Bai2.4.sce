//2.4
clc;
clear;
scf(0);
clf();

// Tin hieu goc, vi tri n = 0 la gia tri 4
n = -2:2;
x = [2 3 4 5 6];

// Dao thoi gian tren truc chi so doi xung
x_reverse = x(length(x):-1:1);

// Phan tich thanh phan chan va le
xe = (x + x_reverse)/2;
xo = (x - x_reverse)/2;

// Kiem tra x = xe + xo
check = xe + xo;
disp(xe, "Thanh phan chan xe:");
disp(xo, "Thanh phan le xo:");
disp(check, "Tong xe + xo:");

subplot(3,1,1);
plot2d3(n, x);
title("Original Signal x(n)");
xlabel("n");
ylabel("x(n)");
xgrid();

subplot(3,1,2);
plot2d3(n, xe);
title("Even Component xe(n)");
xlabel("n");
ylabel("xe(n)");
xgrid();

subplot(3,1,3);
plot2d3(n, xo);
title("Odd Component xo(n)");
xlabel("n");
ylabel("xo(n)");
xgrid();
