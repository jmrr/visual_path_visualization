function [featVector , labels] = buildFeatVec(params, varargin)
% BUILDFEATVEC creates a feature matrix of N examples x D features from
% frames that have been previously encoded with a dictionary of visual
% words. Therefore D will coincide with the number of words selected for
% the dictionary, or dictionary size.
%
% See also tSNE_matlab/TSNE and bh_tsne/FAST_TSNE

% Author: Jose Rivera-Rubio
%         jose.rivera@imperial.ac.uk
% Date: March, 2015

if nargin > 1
   trainingSet = varargin{1};
else
    trainingSet = params.trainingSet;
end


selector  = params.passes; % Leave one out strategy pass selector.
querySet = selector;
querySet(trainingSet) = [];

trainingSetStr = sprintf('%d',trainingSet);

% Encoded passes location
loc = params.dictPath;

% Declare outputs

featVector = [];
labels     = [];

for corr = params.corridors
    
    c = ['C' num2str(corr)];
    
    for pass = querySet
        
        p = ['P' num2str(pass)]; % pass string
        
        fname = fullfile(loc, num2str(params.dictionarySize), params.descriptor, ....
            ['hovw_' params.encoding '_' c '_' trainingSetStr '_' num2str(pass) '.mat']);
        
        load(fname);
        
        featVector = [featVector; HoVW];
        
        labels = [labels; corr*ones(size(HoVW,1),1)];
        
    end
end