# Visual path visualization
 This code applies t-SNE *dimensionality reduction* to the RSM dataset of visual paths (http://rsm.bicv.org).

 It is divided in two phases: data preparation and dimensionality reduction. In the data preparation, a bag-of-words pipeline is applied to the existing descriptors to generate a dictionary of visual words. The size of the dictionary will be the dimensionality of the data that we'd like to reduce with t-SNE.

## Requeriments

#### t-SNE
t-Distributed Stochastic Neighbor Embedding (t-SNE) is a algorithm created by Laurens van der Maaten and Geoffrey Hinton. Both the standard and Barnes-Hut approximations implementations can be downloaded from their website http://lvdmaaten.github.io/tsne/

Both are included in the repo for ease of use but to run the Barnes-Hut binary the sources need to be compiled

```
g++ sptree.cpp tsne.cpp -o bh_tsne -O2
```

For more information, refer to the corresponding README files.

#### K-means

YAEL K-MEANS package is required for fast clustering. https://gforge.inria.fr/projects/yael/

#### Data

A zip version of the data is included in the 'Downloads' section of this repo.

## Usage

Select the correct parameters in `setup.m`
Run `main.m`
