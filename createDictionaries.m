function [] = createDictionaries(params)
% CREATEDICTIONARIES generates all the combination of passes and calls
% clusterDescriptors to construct bag of visual words (BOVW) dictionaries.
%
% Parameters to be used:
%
%   params
%
% From the case of all passes contributing to the dictionary to the case of
% only one pass contributing to the dictionary, select all the possible
% combinations.
% For the time being, leave only one out.
%
% See also private/CLUSTERDESCRIPTORS, private/CLUSTERDESCRIPTORSSPARSE

% Authors: Jose Rivera-Rubio
%          jose.rivera@imperial.ac.uk
% Date: March, 2015


dictPath = fullfile(params.dictPath,num2str(params.dictionarySize));

if strcmpi(params.descriptor,'SIFT')
    clusterDescriptorsSparse(...
        params.descrDir,params.descriptor,params.corridors,...
        params.dictionarySize,trainingSet,dictPath)
else % dense
    clusterDescriptors(...
        params.descrDir,params.descriptor,params.corridors,...
        params.dictionarySize,trainingSet,dictPath)
end
    
end % end createDictionaries