function normalise(path)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function implements normalization of set of images given a path
% and saves the normalised images in your current directory
%
% input
% path - path of images which are required to be bias corrected.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example
%normalise('./out_biascorrected/'); for bias corrected images
%normalise('./data/'); for original images

close all;
files = dir([path, '\*.png']); % to access images of selected path

cc = hsv(length(files)); %for color to histogram plots

for nimage = 1:length(files)
    
    Img = imread([path, '\', files(nimage).name]); % to read images
    
    
    
    %to convert color to gray images
    if length(size(Img)) == 3
        Img = rgb2gray(Img);
    end
    
    %convert to double
    Imgd = double(Img);
    
    %to convert matrix to vector to sort the intensities and divide the
    %image by mean of top 20 intensities
    Img_vec = reshape(Imgd,[1,numel(Imgd)]);
    [intensity pos] = sort(Img_vec);
    mean_int = mean(intensity(:,(length(intensity)-20):length(intensity)));
    Img_nor = Imgd./mean_int;
    Img_nor = Img_nor.*255; % to scale image back to 255
    
    %to convert back to original format
    Img_nor = uint8(Img_nor);
    
    figure(nimage)
    %to show bias corrected images
    subplot(1,2,1)
    imshow(Img,[]);
    title('Original Image ');
    
    %to show corrected images
    subplot(1,2,2)
    imshow(Img_nor,[]);
    title('Normalised image');
    
    %to plot the histogram of bias corrected
    figure(7)
    [counts, x] = imhist(Img); % to plot histogram
    plot(x(2:length(x)),counts(2:length(x)),'color',cc(nimage,:));
    xlabel('signal intensity');
    ylabel('number of samples');
    hold on;
    legendInfo{nimage} = num2str(nimage);
    
    % to plot the histogram of normalised
    figure(8)
    [counts,x] = imhist(Img_nor);
    plot(x(2:length(x)),counts(2:length(x)),'color',cc(nimage,:));
    xlabel('signal intensity');
    ylabel('number of samples');
    hold on;
    
end
legend(legendInfo);