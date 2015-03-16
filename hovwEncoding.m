function [] = hovwEncoding(params, trainingSet)
% HOVWENCODING Histogram of Visual Words encoding. Creates histograms
% with codebook entries (visual words) frequencies by leaving one of the
% passes out.

% Authors: Jose Rivera-Rubio and Ioannis Alexiou
%          {jose.rivera,ia2109}@imperial.ac.uk
% Created: November, 2014
% Latest release: March, 2015

% CONSTANT PARAMETERS
selector  = params.passes; % Leave one out strategy pass selector.
querySet = selector;
querySet(trainingSet) = [];

% Path strings, modify if NOT using the default suggested paths.

descStr  = 'C%dP%d_Descriptors.mat';
dictStr  = 'dictionary_P%s.mat';
dictPath = fullfile(params.dictPath,num2str(params.dictionarySize));


% Construct dictionary path and load vocabulary.

dictionariesPath = fullfile(dictPath,params.descriptor);

trainingSetStr = sprintf('%d',trainingSet);
dictFnameStr = sprintf(dictStr,trainingSetStr);

load(fullfile(dictionariesPath,dictFnameStr)); % Load VWords

% Load query descriptors

for corr = params.corridors
    
    c = ['C' num2str(corr)];
    
    for pass = querySet
        
        p = ['P' num2str(pass)]; % pass string
        
        descriptorsPath = fullfile(params.descrDir,params.descriptor,c,p);
        
        descriptorsFnameStr = sprintf(descStr,corr,pass);
        
        while true
            try
                load(fullfile(descriptorsPath,descriptorsFnameStr)); % Load DescriptorStack
                break
            catch
                fail_msg = ['Failed to load descriptor ' c p];
                disp(fail_msg);
            end % end try/catch
        end
        
        % Encode descriptors with dictionary: vector quantisation
        
        if strcmpi(params.descriptor,'SIFT')
            funStr = ['encodeBOW' 'Sparse(VWords,DescriptorStack)'];
            HoVW = eval(funStr);
        else
            funStr = ['encodeBOW'  '(VWords,DescriptorStack)'];
            HoVW = eval(funStr);
        end
        
        writePath = fullfile(dictionariesPath,...
            ['hovw_' params.encoding '_' c '_' trainingSetStr '_' num2str(pass) '.mat']);
        save(writePath,'HoVW');
        
        disp( ['Pass ' p]);
        
    end % end pass for loop
    
end % end corridor for loop

disp(['All passes encoded for dictionary ' trainingSetStr]);


end % end hovwEncoding