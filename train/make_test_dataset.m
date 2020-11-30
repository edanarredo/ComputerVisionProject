% Need to create a .mat file with...
%   - face picture dimensions
%   - face image integrals
%   - nonface image integrals
%   - faces and nonfaces

% Intention of this script is the create a similar .mat file to 
% the examples1000.mat file from the lecture code
addpath C:\Users\Daniel\Desktop\ComputerVisionProject\data
cd C:\Users\Daniel\Desktop\ComputerVisionProject\data

face_vertical = 100;
face_horizontal = 100;
face_size = [100, 100];

% load 100 faces
location = 'C:\Users\Daniel\Desktop\ComputerVisionProject\data\training_faces';
ds = imageDatastore(location);

% load 100 nonfaces

% find faces integrals

% find nonfaces integrals