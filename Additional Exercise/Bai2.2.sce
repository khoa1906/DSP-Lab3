//2.2
clc;
clear;

// Tin hieu x(n) theo Hinh P2.2:
// x(n)=1 voi -1<=n<=2;
// x(n)=0.5 tai n=3,4; x(n)=0 o noi khac.
function y = xsignal(k)
    y = zeros(1, length(k));
    y(find((k >= -1) & (k <= 2))) = 1;
    y(find((k == 3) | (k == 4))) = 0.5;
endfunction

n = -7:8;
x = xsignal(n);

// (a) 
ya = xsignal(n - 2);
// (b) 
yb = xsignal(4 - n);
// (c) 
yc = xsignal(n + 2);
// (d) 
yd = x .* bool2s(n <= 2);
// (e) 
ye = xsignal(n - 1) .* bool2s(n == 3);
// (f) 
yf = xsignal(n.^2);
// (g), (h)
xreverse = xsignal(-n);
yg = (x + xreverse)/2;
yh = (x - xreverse)/2;

scf(2); clf();
plot2d3(n, x);
xtitle("Original signal x(n)", "n", "Amplitude");
xgrid();

// Hinh 1: (a)-(d)
scf(0); clf();
subplot(2,2,1);
plot2d3(n, ya);
xtitle("(a) x(n-2)", "n", "Amplitude"); xgrid();
subplot(2,2,2);
plot2d3(n, yb);
xtitle("(b) x(4-n)", "n", "Amplitude"); xgrid();
subplot(2,2,3);
plot2d3(n, yc);
xtitle("(c) x(n+2)", "n", "Amplitude"); xgrid();
subplot(2,2,4);
plot2d3(n, yd);
xtitle("(d) x(n)u(2-n)", "n", "Amplitude"); xgrid();

// Hinh 2: (e)-(h)
scf(1); clf();
subplot(2,2,1);
plot2d3(n, ye);
xtitle("(e) x(n-1)delta(n-3)", "n", "Amplitude"); xgrid();
subplot(2,2,2);
plot2d3(n, yf);
xtitle("(f) x(n^2)", "n", "Amplitude"); xgrid();
subplot(2,2,3);
plot2d3(n, yg);
xtitle("(g) Even component xe(n)", "n", "Amplitude"); xgrid();
subplot(2,2,4);
plot2d3(n, yh);
xtitle("(h) Odd component xo(n)", "n", "Amplitude"); xgrid();

// Kiem tra mot so dac diem ly thuyet
mprintf("(e) y[3] = %g\n", ye(find(n==3)));
mprintf("(g)+(h) xuat ra x(n): %d\n", and(abs(yg+yh-x)<1e-10));
