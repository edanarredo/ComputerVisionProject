%% 

% Change PATH variables in 'directories.m' before running this script

restoredefaultpath;
lecture_functions = strcat(training_directory, '\lecture_functions');

addpath(data_directory);
addpath(training_directory);
addpath(lecture_functions);
cd(data_directory);

%% 

% Setup

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
load samples100;

% Label faces and nonfaces
example_number = size(faces, 3) + size(nonfaces, 3);
labels = zeros(example_number, 1);
labels (1:size(faces, 3)) = 1;
labels((size(faces, 3)+1):example_number) = -1;
examples = zeros(face_vertical, face_horizontal, example_number);
examples (:, :, 1:size(faces, 3)) = face_integrals;
examples(:, :, (size(faces, 3)+1):example_number) = nonface_integrals;

classifier_number = numel(weak_classifiers);

responses =  zeros(classifier_number, example_number);

for example = 1:example_number
    integral = examples(:, :, example);
    for feature = 1:classifier_number
        classifier = weak_classifiers {feature};
        responses(feature, example) = eval_weak_classifier(classifier, integral);
    end
    disp(example)
end

save training1000 responses labels classifier_number example_number

%% 

% Verify Correct Responses
clear all;
load training1000
load classifiers1000
load samples100

% choose a classifier
a = random_number(1, classifier_number);
wc = weak_classifiers{a};

% choose a training image
b = random_number(1, example_number);
if (b <= size(faces, 3))
    integral = face_integrals(:, :, b);
else
    integral = nonface_integrals(:, :, b - size(faces,3));
end

% see the precomputed response
disp([a, b]);
disp(responses(a, b));
disp(eval_weak_classifier(wc, integral));

%%

clear all;
load training1000;
weights = ones(example_number, 1) / example_number;


%%
cl = random_number(1, 1000)
[error, thr, alpha] = weighted_error(responses, labels, weights, cl)

%%

weights = ones(example_number, 1) / example_number;
% next line takes about 8.5 seconds.
tic; [index error threshold] = find_best_classifier(responses, labels, weights); toc
disp([index error]);

%%

clear all;
load training1000;
load classifiers1000;
boosted_classifier = AdaBoost(responses, labels, 15);

save boosted boosted_classifier