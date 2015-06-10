
a = imread('img1.jpg');
b = imread('img2.jpg');
c = imread('img3.jpg');
d = imread('img4.jpg');
e = imread('img5.jpg');
f = imread('img6.jpg');
g = imread('img7.jpg');

p1 = a(700:1100,600:1000,:);
p2 = b(1082:1482,600:1000,:);
p3 = b(882:1282,800:1200,:);
p4 = c(250:1000,1:750,:);

%NEW VIDEO FEATURE DETECTION SECTINS
frameNums = linspace(10, 140, 10);
disp(frameNums);
patchXCoords = [80 80 80 80 80 80 80 80 80 80];
patchYCoords = [70 70 70 70 70 70 70 70 70 70];

patches = getVideoPatches('testVid2.3gp', frameNums, ...
        patchXCoords, patchYCoords);
%Display Patches    
subplot(2, 5, 1), imshow(patches{1});
subplot(2, 5, 2), imshow(patches{2});
subplot(2, 5, 3), imshow(patches{3});
subplot(2, 5, 4), imshow(patches{4});
subplot(2, 5, 5), imshow(patches{5});
subplot(2, 5, 6), imshow(patches{6});
subplot(2, 5, 7), imshow(patches{7});
subplot(2, 5, 8), imshow(patches{8});
subplot(2, 5, 9), imshow(patches{9});
subplot(2, 5, 10), imshow(patches{10});

p1 = 0; p2 = 0; p3 = 0; p4 = 0;
min = intmax;
max = 0;
for i = 1:8
   for j = i+i:9
       d  = getPatchDiff(getPatchFeatures(patches{i}), getPatchFeatures(patches{j}), 2);
       if d < min
           min = d;
           p1 = i; p2 = j;
       end
       if d > max
           max = d;
           p3 = i; p4 = j;
       end
   end
end

figure;
subplot(1, 2, 1), imshow(patches{p1});
subplot(1, 2, 2), imshow(patches{p2});
disp(min);

figure;
subplot(1, 2, 1), imshow(patches{p3});
subplot(1, 2, 2), imshow(patches{p4});
disp(max);