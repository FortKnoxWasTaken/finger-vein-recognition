clc;
clear all;
close all;

folder = 'C:\Users\anujc\Documents\MATLAB\FVR\Source Images\Image testing\850';
filenames = dir(fullfile(folder, '*.jpg'));

for i=1:numel(filenames)
    fullname=fullfile(folder, filenames(i).name);
    img = imread(fullname);
    pattern = getfingerpattern(img);
%     imwrite(pattern, append(folder+ '\Outputs\'+filenames(i).name), "jpeg")
end

