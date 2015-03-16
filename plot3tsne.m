function plot3tsne(mappedX, labels, varargin)
% PLOT3TSNE generates 3D scatter plot of the  columns in mappedX grouped by
% labels. Points with the same value in labels are shown with the same
% color. The default marker is '.'

% Author: Jose Rivera-Rubio
%          jose.rivera@imperial.ac.uk
% Date: March, 2015

if nargin > 2
   option = varargin{1};
end

numLabels = max(labels);

for i = 1:numLabels
    idx = (labels==i);
    plot3(mappedX(idx,1), mappedX(idx,2), mappedX(idx,3),'.');
    str{i} = num2str(i);
    hold on;
end

if strcmp(option, 'legend')
    legend(str)
end    

end % end plot3tsne