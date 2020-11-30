%% 

% Updating Paths and Changing Directory

restoredefaultpath;

% will replace these with variables from "directories.m"
addpath C:\Users\Daniel\Desktop\ComputerVisionProject\data;
addpath C:\Users\Daniel\Desktop\ComputerVisionProject\train;
addpath C:\Users\Daniel\Desktop\ComputerVisionProject\train\lecture_functions;
cd C:\Users\Daniel\Desktop\ComputerVisionProject\data;

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
clear all;
load classifiers1000;
% **Need to finish make_test_dataset.m
% load samples100;

% Label faces and nonfaces
sample_number = size(faces, 3) + size(nonfaces, 3);
labels = zeros(sample_number, 1);
labels (1: size(faces, 3)) = 1;
labels((size(faces, 3)+1):sample_number) = -1;

examples = zeros(face_vertical, face_hotizontal, sample_number);
examples (:, :, 1:size(faces, 3)) = face_integrals;
examples (:, :, (size(faces, 3) + 1): example_number) = nonface_integrals;

classifier_number = nume1(weak_classifiers);

responses = zeros(classifier_number, sample_number);

for example = 1: sample_number
    integral = examples(:, :, example);
    for feature = 1: classifier_number
        classifier = weak_classifiers {feature};
        responses(feature, example) = eval_weak_classifier(classifier, integral);
    end 
    disp(example)
end






