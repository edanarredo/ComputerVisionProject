% Need to create a .mat file with...
%   - face picture dimensions
%   - face image integrals
%   - nonface image integrals
%   - faces and nonfaces

% Intention of this script is the create a similar .mat file to the examples1000.mat file from the lecture code
addpath C:\Users\Daniel\Desktop\ComputerVisionProject\data
addpath C:\Users\Daniel\Desktop\ComputerVisionProject\train\lecture_functions
cd C:\Users\Daniel\Desktop\ComputerVisionProject\data

face_vertical = 100;
face_horizontal = 100;
face_size = [100, 100];

%% 

% load 100 faces
% faces = a 3d array of 100 faces (size 100x100 by default)
faces_list = dir('training_faces/*.bmp');
face_names = {faces_list.name};

faces = zeros(100, 100, 100);
for i = 1: 100
    faces(:,:,i) = imread(strcat('training_faces/',face_names{i}));
end

%% 

% load 100 nonfaces
% nonfaces = a 3d array of 100 nonfaces (resize to 100x100)
nonfaces_list = dir('training_nonfaces/*.jpg');
nonface_names = {nonfaces_list.name};

nonfaces = zeros(100, 100, 100);
for i = 1: 100
    nonface_to_insert = rgb2gray(imread(strcat('training_nonfaces/', nonface_names{i})));
    imshow(nonface_to_insert, []);
    [row, col] = size(nonface_to_insert);
    nonface_to_insert = imcrop(nonface_to_insert, [row/2, col/2, row-101, col-101]);
end

%%

% find faces integrals
% faces_integrals = a 3d array of 100 face integral images

%%

% find nonfaces integrals
% nonfaces_integrals = a 3d array of 100 nonface integral images

%%

% Create .mat file

save samples100 face_vertical face_horizontal face_size