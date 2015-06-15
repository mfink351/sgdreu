
%a = imread('img1.jpg');
%b = imread('img2.jpg');
%c = imread('img3.jpg');
%d = imread('img4.jpg');
%e = imread('img5.jpg');
%f = imread('img6.jpg');
%g = imread('img7.jpg');
%p1 = a(700:1100,600:1000,:);
%p2 = b(1082:1482,600:1000,:);
%p3 = b(882:1282,800:1200,:);
%p4 = c(250:1000,1:750,:);

%NEW VIDEO FEATURE DETECTION SECTIONS
taskName = 'Test/';
keyFrameNums = getKeyFrames('complex.3gp');
[~,c] = size(keyFrameNums);
for i = 1 : c
    patchXCoords(i,1) = 80;
    patchYCoords(i,1) = 80;
end

patches = getVideoPatches('complex.3gp', keyFrameNums, ...
        patchXCoords, patchYCoords, 50, taskName);

%{Grab the two most likely and two least like patches
%p1 = 0; p2 = 0; p3 = 0; p4 = 0;
%min = intmax;
%max = 0;
%for i = 1:c-2
%   for j = i+i:c-1
%       d  = getPatchDiff(getPatchFeatures(patches{i}), getPatchFeatures(patches{j}), 2);
%       if d < min
%           min = d;
%           p1 = i; p2 = j;
%       end
%       if d > max
%           max = d;
%           p3 = i; p4 = j;
%       end
%   end
%end

%figure;
%subplot(1, 2, 1), imshow(patches{p1});
%subplot(1, 2, 2), imshow(patches{p2});
%disp(min);

%figure;
%subplot(1, 2, 1), imshow(patches{p3});
%subplot(1, 2, 2), imshow(patches{p4});
%}disp(max);