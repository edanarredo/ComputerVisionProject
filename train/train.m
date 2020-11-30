%% 

% Updating Paths and Changing Directory

restoredefaultpath;

% will replace these with variables from "directories.m"
addpath C:\Users\Daniel\Desktop\ComputerVisionProject\src;
addpath C:\Users\Daniel\Desktop\ComputerVisionProject\data;
addpath C:\Users\Daniel\Desktop\ComputerVisionProject\train;
addpath C:\Users\Daniel\Desktop\ComputerVisionProject\train\lecture_functions;
cd C:\Users\Daniel\Desktop\ComputerVisionProject\train;

%% 

% Setup
face_horizontal = 100;
face_vertical = 100;

% Choosing set of random weak classifiers
number = 1000;
weak_classifiers = cell(1, number);
for classifier = 1: number
    weak_classifiers{classifier} = generate_classifier(face_vertical, face_horizontal);
end

% Save table of empty weak classifiers into classifiers1000.mat
save classifiers1000 weak_classifiers;

%%

% Start 
clear all
load classifiers1000
% Need to finish make_test_dataset.m

% Choose a classifier
% a = random_number(1, classifier_number); 
% weak_classifier = weak_classifiers{a};






