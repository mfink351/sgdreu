
imgSets = imageSet('Tasks','recursive');
[trainingSets, testSets] = partition(imgSets, 0.3, 'randomize');

bag = bagOfFeatures(trainingSets, 'Verbose', false);
classifier = trainImageCategoryClassifier(trainingSets, bag);

confMatrix = evaluate(classifier, testSets);
disp(mean(diag(confMatrix)));

map = containers.Map({'Computers', 'WhiteBoards'}, {0 0});
disp(map);

for i = 1:33
    imgLoc = strcat(strcat('Test/', num2str(i)), '.jpg');
    testImg = imread(imgLoc);
    [labelIdx, score] = predict(classifier, testImg);
    %disp(classifier.Labels(labelIdx));
    
    newVal = map(char(classifier.Labels(labelIdx))) + 1;
    remove(map, {char(classifier.Labels(labelIdx))});
    map(char(classifier.Labels(labelIdx))) = newVal;
end

disp(keys(map));
disp(values(map));