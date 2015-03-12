# Visual path clustering#
 This code applies t-SNE dimensionality reduction to the RSM dataset of visual paths.

 It is divided in two phases: data preparation and dimensionality reduction. In the data preparation, a bag-of-words pipeline is applied to generate a dictionary of visual words. The size of the dictionary will be the dimensionality of the data that we'd like to reduce with t-SNE.