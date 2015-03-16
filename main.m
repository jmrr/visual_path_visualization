% Main t-SNE
%
% See also tSNE_matlab/TSNE and bh_tsne/FAST_TSNE

% Author: Jose Rivera-Rubio
%         jose.rivera@imperial.ac.uk
% Date: March, 2015

%% Setup

setup;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% First part: Feature vector creation from BOVW pipeline
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate training set indices

trainingSet = randperm(max(params.passes),params.trainingPassesPerCorr);

% Create dictionary

createDictionaries(params, trainingSet);

% Encode

hovwEncoding(params, trainingSet);

% Build feature vector for t-sne

[featVector , labels] = buildFeatVec(params, trainingSet);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Second part: t-sNE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

initial_dims = 50;
perplexity = 30;
cd bh_tsne/

%% 2D compute
no_dims   = 2;

if exist('bh_tsne2','file')
    mappedX2d = fast_tsne(featVector, no_dims, initial_dims, perplexity,0.5);
else
    mappedX2d = tsne(featVector, [], no_dims, initial_dims, perplexity);
end

% 2D plot
colorOrder = get(gca, 'ColorOrder');
gscatter(mappedX2d(:,1), mappedX2d(:,2), labels,colorOrder(1:max(labels),:));
title('Distribution of the BOW data of the RSM dataset in a reduced 2D space')

%% 3D compute
no_dims   = 3;

if exist('bh_tsne2','file')
    mappedX3d = fast_tsne(featVector, no_dims, initial_dims, perplexity,0.5);
else
    mappedX3d = tsne(featVector, [], no_dims, initial_dims, perplexity);
end
%% 3D plot

plot3tsne(mappedX3d, labels,'legend','on');
title('Distribution of the BOW data of the RSM dataset in a reduced 3D space')
grid on;
%% Return to parent dir

cd ..