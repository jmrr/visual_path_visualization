selector  = params.passes; % Leave one out strategy pass selector.
querySet = selector;
querySet(trainingSet) = [];

trainingSetStr = sprintf('%d',trainingSet);


loc = 'encoded_passes';

labels = [];

for corr = params.corridors
    
    c = ['C' num2str(corr)];
    
    for pass = querySet
        
        p = ['P' num2str(pass)]; % pass string
        
        fname = fullfile(loc,...
            ['hovw_' params.encoding '_' c '_' trainingSetStr '_' num2str(pass) '.mat']);
        
        load(fname);
        
        featVector = [featVector; HoVW];
        
        labels = [labels; corr*ones(size(HoVW,1),1)];
        
    end
end