% Main

% Setup

setup;

% Generate training set indices

trainingSet = randperm(max(params.passes),params.trainingPassesPerCorr);

% Create dictionary

createDictionaries(params, trainingSet);

% Encode

hovwEncoding(params, trainingSet);

% Build feature vector for t-sne

buildFeatVec