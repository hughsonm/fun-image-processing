close all;
clearvars;

IMAGE_SCALE = 0.5;
NUM_SEGMENTS = 16;

top_dir = fullfile("..","..");
addpath(top_dir);

% Image Credit:
% "Monkey Face" by MarkGrundland is licensed under CC BY 2.0

I = imread("MonkeyFace.jpg");
R = imresize(I,IMAGE_SCALE);
K = KMeansSegment(R,NUM_SEGMENTS);

ff = figure("Name",sprintf("K-Means with %d segments, scaled %.3fx", NUM_SEGMENTS, IMAGE_SCALE));
imshow(K);

output_name = sprintf("MonkeyFace-%d-%.3f.png", NUM_SEGMENTS, IMAGE_SCALE);
imwrite(K, output_name);
