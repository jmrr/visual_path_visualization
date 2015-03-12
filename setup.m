%% Parameter variables. Change these values HERE

params = struct(...
    'descriptor',    'DSIFT',...  % SIFT, DSIFT, SF_GABOR, ST_GABOR, ST_GAUSS,
    'corridors',     [1:6],... % Corridors to run [1:6] (RSM v6.0)
    'passes',        [1:10],... % Passes to run [1:10] (RSM v6.0)
    'datasetDir',    '/home/jose/PhD/Data/VISUAL_PATHS/v6.0',...   % The root path of the RSM dataset
    'trainingPassesPerCorr', 4, ...
    'frameDir',      'frames_resized_w208p',... % Folder name where all the frames have been extracted.
    'descrDir',  ...
    '/media/Data/localisation_from_visual_paths_data/descriptors/', ...
    'dictionarySize', 4000, ...
    'dictPath',       './dictionaries', ...
    'encoding', 'VLAD', ... % 'HA', 'VLAD'
    'kernel', 'Hellinger', ... % 'chi2', 'Hellinger'
    'kernelPath', './kernels', ...
    'metric', 'max', ...
    'groundTruthPath', '/home/jose/PhD/Data/VISUAL_PATHS/v6.0/ground_truth', ...
    'debug', 1 ... % 1 shows waitbars, 0 does not.
    );