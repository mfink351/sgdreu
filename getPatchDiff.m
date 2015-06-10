function diff = getPatchDiff(f1, f2, i)
    if i == 1
        diff = norm(f1-f2);
    elseif i == 2
        diff = sum((f1-f2).^2);
    end
    