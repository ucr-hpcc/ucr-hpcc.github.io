---
linkTitle: AlphaFold
title: AlphaFold Usage on HPCC
type: docs
weight: 1
---


## AlphaFold2 
Description of AlphaFold2

### Loading the module

You can load AlphaFold2 using the following commands:
```bash
module load alphafold/
singularity shell $ALPHAFOLD_SING
```
You can also run AlphaFold2 with a gpu. If you wish to use a GPU, [log into a gpu node](https://hpcc.ucr.edu/manuals/hpc_cluster/jobs/#gpu-jobs) and then use the following commands:
```
module load alphafold/
singularity shell --nv $ALPHAFOLD_SING
```

### Using Alphafold Databases

When running the alphafold command, you will be asked for certain databases. These databases can be found under the path $DATABASE_DIR/alphafold.
