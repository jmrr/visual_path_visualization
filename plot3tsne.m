function plot3tsne(mappedX, labels)

numLabels = max(labels);

for i = 1:numLabels
    
    idx = (labels==i);
    plot3(mappedX(idx,1), mappedX(idx,2), mappedX(idx,3),'.');
    hold on;
    
end

end