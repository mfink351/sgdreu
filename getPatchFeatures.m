function patchFeatVect = getPatchFeatures(b)
    %Convert b to hsv
    c = rgb2hsv(b);
    satHist = imhist(c(:,:,2), 12);
    valHist = imhist(c(:,:,3), 12);

    %Extract Orientation Features usin FAST and HOG
    numCorners = 200;
    corners   = detectFASTFeatures(rgb2gray(b));
    strongest = selectStrongest(corners,numCorners);
    [hog2, ~, ~] = extractHOGFeatures(b,strongest); 
    hogHist = mean(hog2);

    %Create Patch Feature Vector
    satSTD = std(satHist); valSTD = std(valHist); hogSTD = std(hogHist);
    satHist = vertcat(satHist, satSTD);
    valHist = vertcat(valHist, valSTD);
    hogHist = [hogHist hogSTD];

    patchFeatVect = vertcat(satHist, valHist);
    %disp(hogHist);
    patchFeatVect = vertcat(patchFeatVect, reshape(hogHist, [37 1]));
    %plot(patchFeatVect);