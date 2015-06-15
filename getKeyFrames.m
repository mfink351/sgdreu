%Returns the KeyFrames from the given video supplied by vidName
%Runs in O(2n) time where n is the number of frames in the video
%@Author: Mike Fink
%@LastModified: 6/15/2015
function keyFrames = getKeyFrames(vidName)
 
   readerobj = VideoReader(vidName);
   for k=1:  readerobj.NumberOfFrames
       I=read(readerobj,k);
       if(k~= readerobj.NumberOfFrames)
           J=read(readerobj,k+1);
           sss=absdif(I,J);
           X(k)=sss;
       end
   end

   %Set Threshold
   mean=mean2(X);
   std=std2(X);
   threshold=std+mean*.5;

   %Extract KeyFrames
   keyFrames = [];
   for k=1: readerobj.NumberOfFrames
       I = read(readerobj,k);
       if(k~=readerobj.NumberOfFrames)
           J = read(readerobj,k+1);
           sss=absdif(I,J);
           if(sss>threshold)
               keyFrames = [keyFrames, k+1];
               imshow(J);
               %imwrite(J, strcat(strcat('image', num2str(k)), '.jpg'));
           end
       end
   end
   disp(keyFrames);