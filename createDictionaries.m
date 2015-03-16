function [] = createDictionaries(params, varargin)
% CREATEDICTIONARIES select the right method and calls the adequate
% clusterDescriptors to construct bag of visual words (BOVW) dictionaries.
%
% Parameters to be used:
%
%   params
%
% See also private/CLUSTERDESCRIPTORS, private/CLUSTERDESCRIPTORSSPARSE

% Author: Jose Rivera-Rubio
%         jose.rivera@imperial.ac.uk
% Date: March, 2015

if nargin > 1
   trainingSet = varargin{1};
else
    trainingSet = params.trainingSet;
end

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