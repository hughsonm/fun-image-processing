function new_A = KMeansSegment(A,n_segments)

nrows = size(A,1);
ncols = size(A,2);
nchan = size(A,3);

norm_rows = (0:(nrows-1))/(nrows);
norm_cols = (0:(ncols-1))/(ncols);

channel_maxima = max(max(A,[],1),[],2);
channel_minima = min(min(A,[],1),[],2);

norm_A = A-channel_minima;
norm_A = double(norm_A)./double(channel_maxima-channel_minima);

[C,R] = meshgrid(norm_cols,norm_rows);

X = [C(:),R(:)];

for ii = 1:nchan
    slice = norm_A(:,:,ii);
    X(:,end+1) = slice(:);
end

[idcs,vals] = kmeans(X,n_segments,...
    'MaxIter',1000);

new_X = 0*X;
for ii = 1:size(vals,1)
    new_X(idcs==ii,:) = new_X(idcs==ii,:) + vals(ii,:);
end

new_A = 0*norm_A;

for ii = 1:nchan
    slice = reshape(new_X(:,ii+2),nrows,ncols);
    new_A(:,:,ii) = slice;
end

end

