function diff = getPatchDiff(f1, f2, i)
    if i == 1
        diff = norm(f1-f2);
    end