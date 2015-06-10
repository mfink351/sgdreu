%Returns the specified patches from the 
%
%
function patches = getVideoPatches(videoURI, patchFrames, ...
    patchXCoords, patchYCoords)

    %Create the video object
    vidObj = VideoReader(videoURI);
    patches = [];
    [~,c] = size(patchFrames);
    %
    for i = 1:c
        frameNum = patchFrames(i);
        frame = read(vidObj, frameNum);
        
        patchX = patchXCoords(i);
        patchY = patchYCoords(i);
     
        
        frame =  frame(patchY-50:patchY+50,patchX-50:patchX+50,:);
        patches{i} = im2double(frame);
    end