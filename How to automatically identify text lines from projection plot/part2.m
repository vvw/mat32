darkPixels = R < 20; % Threshold
% label
labeledRegions = bwlabel(darkPixels);
% Find centroids
measurements = regionprops(labeledRegions, 'Centroid');
% Get them into an array
allCentroids = [measurements.Centroid];
% Now you can just crop out some line of text you're interested in, into a separate image:

thisLine = yourImage(allCentroids(k):allCentroids(k+1), :);