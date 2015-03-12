% Main

% Setup

setup;

% Generate training set indices

trainingSet = randperm(max(params.passes),params.trainingPassesPerCorr);

