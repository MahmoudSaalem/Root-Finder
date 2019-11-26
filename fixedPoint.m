function [i,root,data] = fixedPoint(f, g, xi, epsilon, maxNumberOfIterations)

data = 0;
root = 0;
i = 1;

syms x
differentiation = eval(['@(x)' char(diff(g(x)))]);
result = abs(differentiation(xi));

if result >= 1
    errordlg('Functions diverges, Change g(x).');
    return;
end

while true
    
    root = g(xi);
    approximateError = abs((root - xi)/root) * 100;
    
    data(i,1) = i;
    data(i,2) = xi;
    data(i,3) = root;
    data(i,4) = approximateError;
    
    fprintf('%2i  %f  %f  %f \n', i, xi, root, approximateError);   
    
    [done] = checkConditions(i, maxNumberOfIterations, approximateError, epsilon, f, root);
    
    if (done == true)
        break;
    end
    
    i = i + 1;
    xi = root;
end


end

