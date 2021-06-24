function [A] = AssignPixels(A,centres)
%ASSIGNPIXELS Changes the value of each pixel in A to closest centre
% each row of centres is a single centre
for irow = 1:size(A,1)
    for icol = 1:size(A,2)
        pix = squeeze(A(irow,icol,:)).';
        sqdists = sum((pix-centres).^2,2);
        [~,mindx] = min(sqdists);
        closest = centres(mindx,:);
        A(irow,icol,:) = closest;
    end
end
end

