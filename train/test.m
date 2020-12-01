%%
restoredefaultpath;
lecture_functions = strcat(training_directory, '\lecture_functions');

addpath(data_directory);
addpath(training_directory);
addpath(lecture_functions);
cd(data_directory);

%%

clear all;
load classifiers1000;
load boosted;

photo = read_gray('test_face_photos\obama8.jpg');

figure(1); imshow(photo, []);

tic; result = boosted_multiscale_search(photo, 1, boosted_classifier, weak_classifiers, [100, 100]); toc
figure(2); imshow(result, []);
figure(3); imshow(max((result > 4) * 255, photo * 0.5), [])

%%

tic; [result, boxes] = boosted_detector_demo(photo, 1, boosted_classifier, weak_classifiers, [100, 100], 2); toc
figure(2); imshow(result, []);