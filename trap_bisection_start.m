function [data, i, done] = trap_bisection_start(f, xl, xu)
% check if there are roots in the interval
fl = f(xl);
fu = f(xu);
if(fl*fu > 0)
    data = [];
    i = [];
    done = 0;
    errordlg('There is no change in the sign of the function over this interval.');
    return;
end
% calculate new root
xr = (xl+xu)/2;
fr = f(xr);
% populate data table
i = 1;
data(i,1) = xl;
data(i,2) = fl;
data(i,3) = xu;
data(i,4) = fu;
data(i,5) = xr;
data(i,6) = fr;
data(i,7) = 100;
% prepare for next iteration
if (fl*fr < 0)    
    data(i+1,1) = xl;
    data(i+1,2) = fl;
    data(i+1,3) = xr;
    data(i+1,4) = fr;
elseif (fl*fr > 0)
    data(i+1,1) = xr;
    data(i+1,2) = fr;
    data(i+1,3) = xu;
    data(i+1,4) = fu;
else
    data(1,7) = 0;
    done = 1;
    return;
end
done = 0;
end