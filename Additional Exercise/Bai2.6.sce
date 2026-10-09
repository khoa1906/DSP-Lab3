//2.6
clc;
clear;

function z = input_signal(k)
    z = bool2s((k >= 0) & (k <= 3));
endfunction

function show_system(n, signals, captions, w)
    scf(w); clf();
    for i = 1:6
        subplot(3, 2, i);
        plot2d3(n, signals(i, :));
        xtitle(captions(i), "n", "Amplitude");
        xgrid();
    end
endfunction

n = -6:8;
x = input_signal(n);
x2 = input_signal(n - 2);

// (b): y(n) = x(n^2)
yb = input_signal(n.^2);
ybs = input_signal((n - 2).^2);
y2b = input_signal(n.^2 - 2);
capb = ["x(n)"; "y(n)=x(n^2)";
        "y(n-2)"; "x2(n)=x(n-2)";
        "y2(n)=T[x2(n)]"; "y2(n)-y(n-2)"];
show_system(n, [x;yb;ybs;x2;y2b;y2b-ybs], capb, 1);

// (c): y(n) = x(n) - x(n-1)
yc = input_signal(n) - input_signal(n-1);
ycs = input_signal(n-2) - input_signal(n-3);
y2c = x2 - input_signal(n-3);
capc = ["x(n)"; "y(n)=x(n)-x(n-1)";
        "y(n-2)"; "x2(n)=x(n-2)";
        "y2(n)=T[x2(n)]"; "y2(n)-y(n-2)"];
show_system(n, [x;yc;ycs;x2;y2c;y2c-ycs], capc, 2);

// (d): y(n) = n*x(n)
yd = n .* x;
yds = (n - 2) .* x2;
y2d = n .* x2;
capd = ["x(n)"; "y(n)=n*x(n)";
        "y(n-2)"; "x2(n)=x(n-2)";
        "y2(n)=T[x2(n)]"; "y2(n)-y(n-2)"];
show_system(n, [x;yd;yds;x2;y2d;y2d-yds], capd, 3);
