function diff_img = getdiffusion(img, niter, kappa, lambda, option_type, option_eq)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function deals with two types of diffusion (anisotropic and isotropic)
% 
% Input
% 
%          im     - input image
%          niter  - number of iterations.
%          kappa  - conduction coefficient 20-100 ?
%          lambda - max value of .25 for stability
%          option_type - 1 anisotropic
%                        2 Isotropic
%          option_eq - 1 Perona Malik diffusion equation No 1
%                      2 Perona Malik diffusion equation No 2
% Output
%     You would get a figure of input image and filtered image
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example
% img = rgb2gray(imread('pa6-16_t2.png'));
% getdiffusion(img,500,5,0.25,1,1); % for anisotropic diffusion
% getdiffusion(img,500,5,0.25,2,1); % for isotropic diffusion

if option_type == 1
    diff_img = anisodiff(img,niter,kappa,lambda,option_eq);
    figure, subplot 121, imshow(img) ,title('original image')
    subplot 122, imshow(diff_img,[]), title('anisotropic filtered image');
elseif option_type == 2
    diff_img = isodiff(img,niter,lambda);
    figure, subplot 121, imshow(img) ,title('original image')
    subplot 122, imshow(diff_img,[]), title('isotropic filtered image');
end

