% SETUP selects the different parameters to create a dictionary of visual 
% words with all the Visual Path data from the RSM dataset and run
% dimensionality reduction using t-SNE to visualize the data

% Author: Jose Rivera-Rubio
%         jose.rivera@imperial.ac.uk
% Date: March, 2015


%% Add paths

addpath('bh_tsne');
addpath('tSNE_matlab');


%% Parameter variables. Change these values HERE

params = struct(...
    'descriptor',    'DSIFT',...  % SIFT, DSIFT, SF_GABOR, ST_GABOR, ST_GAUSS,
    'corridors',     [1:6],... % Corridors to run [1:6] (RSM v6.0)
    'passes',        [1:10],... % Passes to run [1:10] (RSM v6.0)
    'datasetDir',    'dataset/location/to/be/defined/',...   % The root path of the RSM dataset
    'trainingPassesPerCorr', 4, ...
    'trainingSet', [7 4 8 3], ...
    'descrDir',  ...
    '/descriptor/location/to/be/defined/', ...
    'dictionarySize', 4000, ...
    'dictPath',       './data/dictionaries', ...
    'encoding', 'HA', ... % 'HA', 'VLAD'
    'debug', 1 ... % 1 shows waitbars, 0 does not.
    );