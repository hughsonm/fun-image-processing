close all;
clearvars;

IMAGE_SCALE = 1.0;
NUM_SEGMENTS = 64;

top_dir = fullfile("..","..");
addpath(top_dir);

% Image Credit:
% "Monkey Face" by MarkGrundland is licensed under CC BY 2.0



I = imread("~/Downloads/Kira-Thigh.jpg");
R = imresize(I,IMAGE_SCALE);
K = KMeansSegment(R,NUM_SEGMENTS);

ff = figure("Name",sprintf("K-Means with %d segments, scaled %.3fx", NUM_SEGMENTS, IMAGE_SCALE));
imshow(K);

output_name = sprintf("Kira-Thigh-%d-%.3f.png", NUM_SEGMENTS, IMAGE_SCALE);
imwrite(K,fullfile("~", "Pictures","Kira", output_name));
