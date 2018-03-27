function biascorrection(path)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function implements bias correction of set of images given a path
% and saves the bias corrected images in your current directory
% 
% input
% path - path of images which are required to be bias corrected.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example
% biascorrection('./data/');

close all; % to close all figure windows

files = dir([path, '\*.png']); % to access images of selected path

for nimage = 1:length(files)
    
    Img = imread([path, '\', files(nimage).name]); % to read images
    bias_out = Demo_MICO(Img);  %for bias field correction
    imwrite(bias_out,sprintf('bias_out%d.png',nimage)) % to save bias corrected images
    
    figure
    %to show original images
    subplot(1,2,1)
    imshow(Img,[]);
    title('Original Image');
      
    %to show corrected images
    subplot(1,2,2)
    imshow(bias_out,[]);
    title('bias corrected image');
    
    end
