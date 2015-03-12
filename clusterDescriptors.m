function [] = clusterDescriptors(descriptorsPath,featureType,corridors,numWords,trainingSet,dictPath)
% CLUSTER_DESCRIPTORS(descriptorsPath,featureType,corridors,numWords,trainingSet,dictPath)
% groups randomly selected descriptors from the specified training set into 
% num_words clusters using k-means.
%
% Requirements: YAEL K-MEANS package for fast clustering.
% https://gforge.inria.fr/projects/yael/
%

% Authors: Jose Rivera and Ioannis Alexiou
%          April, 2014

selectedDescr = [];

for corr = corridors

    for passes = trainingSet
        
        c = ['C' num2str(corr)]; % corridor string
        p = ['P' num2str(passes)]; % pass string
        
        % Load all the descriptors for this particular pass.
        load(fullfile(descriptorsPath,featureType,c,p,...
            [c p '_Descriptors.mat']));
        descDim = size(DescriptorStack,2);
        % Randomly select 800 descriptors from each frame
        randDesc = randi([1 size(DescriptorStack,3)],[1 800]);
        
        % Randomly select 200 frames from the whole sequence
        randFrames = randi([1 size(DescriptorStack,1)],[1 200]);
        
        % Stack up the selected descriptors (row wise).
        selectedDescr = [selectedDescr; ...
            reshape(shiftdim(DescriptorStack(randFrames,:,randDesc),2),...
            [],descDim)];
        
        % Free up some memory
        clear DescriptorStack GridStack;
    end % end for passes
    
end % end for corridors

 % Normalisation of the selected descriptors
    
    desc_norm = sqrt(sum(selectedDescr.^2,2));
    
    selectedDescr = ...
        selectedDescr./repmat((desc_norm + eps),[1,descDim]);
    
    % Show message
    training_name = sprintf('%d',trainingSet);

    fprintf('Permuted samples from: %s\n',training_name);
    
    % K-MEANS (Requires Yael k-means from INRIA).
    
    VWords = yael_kmeans(single(selectedDescr)',numWords,'niter',20,'verbose',2,'seed',3);
    
    % Save dictionary
    savepath = fullfile(dictPath,featureType,c);
    mkdir(savepath);
    save(fullfile(savepath,['dictionary_' c '_P' training_name '.mat']),'VWords')

end % end function

