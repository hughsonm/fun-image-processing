close all;
clearvars;

IMAGE_SCALE = 1.0;
NUM_SEGMENTS = 16;

top_dir = fullfile("..","..");
addpath(top_dir);

% Image Credit:
% "Monkey Face" by MarkGrundland is licensed under CC BY 2.0 



I = imread("MonkeyFace.jpg");
R = imresize(I,IMAGE_SCALE);
K = KMeansSegment(R,NUM_SEGMENTS);

ff = figure();
imshow(K);
ff.Name = "K-Means with " + NUM_SEGMENTS +...
    " segments, imaged scaled " + IMAGE_SCALE + "x";

output_name = "MonkeyFace-" + NUM_SEGMENTS + ".jpg";
imwrite(K,output_name);