%Returns the specified patches from the video
%
function patches = getVideoPatches(videoURI, patchFrames, ...
    patchXCoords, patchYCoords, patchSize, taskName)

    %Create the video object
    vidObj = VideoReader(videoURI);
    patches = [];
    [~,c] = size(patchFrames);
    %
    for i = 1:c
        frameNum = patchFrames(i);
        frame = read(vidObj, frameNum);
        
        %Get Patch X and Y location
        patchX = patchXCoords(i);
        patchY = patchYCoords(i);
        
        %Get Frame and add it to patches
        frame =  frame(patchY-patchSize:patchY+patchSize, ...
            patchX-patchSize:patchX+patchSize,:);
        patches{i} = im2double(frame);
        
        %ImageLocation to write to
        %randi(9999999999999)
        imgLoc = strcat(strcat(strcat('Tasks/', taskName), ...
            num2str(i)), '.jpg');
        imwrite(frame, imgLoc);
    end