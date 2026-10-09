//2.1
clc;
clear;

// Ham bieu dien tin hieu x(n) cua de bai
function y = x_signal(k)
    a = bool2s((k >= -3) & (k <= -1));
    b = bool2s((k >= 0) & (k <= 3));
    y = (1 + k/3).*a + b;
endfunction

n = -8:8;
x = x_signal(n);

// Cau (b1): dao thoi gian truoc, tre 4 mau sau
x_fold = x_signal(-n);
y1 = x_signal(4-n);

// Cau (b2): tre 4 mau truoc, dao thoi gian sau
x_delay = x_signal(n-4);
y2 = x_signal(-n-4);

// Cau (c): trung voi cau (b1)
y3 = x_signal(-n+4);

// Cau (e): bieu dien bang ham buoc don vi
u_m3 = bool2s(n >= -3);
u_0 = bool2s(n >= 0);
u_4 = bool2s(n >= 4);
x_step = (1+n/3).*(u_m3-u_0) + (u_0-u_4);

// Cau (e): bieu dien bang ham xung don vi
x_impulse = (1/3)*bool2s(n == -2) ...
          + (2/3)*bool2s(n == -1) ...
          + bool2s(n == 0) ...
          + bool2s(n == 1) ...
          + bool2s(n == 2) ...
          + bool2s(n == 3);

// Hinh 1: dao truoc, tre sau
scf(0); clf();
subplot(3,1,1);
plot2d3(n, x);
xtitle("Original x(n)", "n", "x(n)");
xgrid();

subplot(3,1,2);
plot2d3(n, x_fold);
xtitle("Folded x(-n)", "n", "x(-n)");
xgrid();

subplot(3,1,3);
plot2d3(n, y1);
xtitle("Fold then delay: x(4-n)", "n", "y1(n)");
xgrid();

// Hinh 2: tre truoc, dao sau
scf(1); clf();
subplot(3,1,1);
plot2d3(n, x);
xtitle("Original x(n)", "n", "x(n)");
xgrid();

subplot(3,1,2);
plot2d3(n, x_delay);
xtitle("Delayed x(n-4)", "n", "x(n-4)");
xgrid();

subplot(3,1,3);
plot2d3(n, y2);
xtitle("Delay then fold: x(-n-4)", "n", "y2(n)");
xgrid();

// Hinh 3: kiem tra hai cach bieu dien cau (e)
scf(2); clf();
subplot(3,1,1);
plot2d3(n, x);
xtitle("Original x(n)", "n", "x(n)");
xgrid();

subplot(3,1,2);
plot2d3(n, x_step);
xtitle("Using unit-step signals", "n", "x(n)");
xgrid();

subplot(3,1,3);
plot2d3(n, x_impulse);
xtitle("Using unit impulses", "n", "x(n)");
xgrid();

// Kiem tra cac ket qua
mprintf("Cau (c) trung cau (b1): %d\n", and(y1 == y3));
mprintf("Bieu dien step dung: %d\n", ...
        and(abs(x-x_step) < 1e-10));
mprintf("Bieu dien impulse dung: %d\n", ...
        and(abs(x-x_impulse) < 1e-10));
