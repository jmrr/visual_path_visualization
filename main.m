% Main

% Setup

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


