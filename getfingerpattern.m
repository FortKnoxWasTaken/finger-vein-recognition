function pattern = getfingerpattern(img)
    img = im2gray(im2double(img)); % Read the image
    img = imresize(img,0.5);               % Downscale image
    
    fvr = lee_region(img,4,40);    % Get finger region
    
    %% Extract veins using maximum curvature method
    sigma = 3; % Parameter
    v_max_curvature = max_curvature(img,fvr,sigma);
    
    % Binarise the vein image
    md = median(v_max_curvature(v_max_curvature>0));
    v_max_curvature_bin = v_max_curvature > md; 
    
    %% Visualise
    % Overlay the extracted veins on the original image
    overlay_max_curvature = zeros([size(img) 3]);
    overlay_max_curvature(:,:,1) = img;
    overlay_max_curvature(:,:,2) = img + 0.4*v_max_curvature_bin;
    overlay_max_curvature(:,:,3) = img;
    
    figure;
    subplot(2,2,1)
      imshow(img,[])
      title('Original captured image')
    subplot(2,2,2)
      imshow(fvr)
      title('Detected finger region')
    subplot(2,2,3)
      imshow(v_max_curvature_bin)
      title('Binarised veins extracted')
    subplot(2,2,4)
      imshow(overlay_max_curvature)
      title('Maximum curvature method') 
     
    pattern = figure;