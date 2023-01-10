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
You can also run AlphaFold2 with a gpu. If you wish to use a GPU, [log into a P100 gpu node](https://hpcc.ucr.edu/manuals/hpc_cluster/jobs/#gpu-jobs) and then use the following commands:
```
module load alphafold/
singularity shell --nv $ALPHAFOLD_SING
```

### Using Alphafold Databases

When running the alphafold command, you will be asked for certain databases. These databases can be found under the path $DATABASE_DIR/alphafold/2.1.2.

Here is an example of how to write your alphafold command :
```bash
python3 /app/alphafold/run_alphafold.py \
--db_preset=reduced_dbs \
--use_gpu_relax=True \
--data_dir=$DATABASES_DIR/alphafold/2.1.2 \
--uniref90_database_path=$DATABASES_DIR/alphafold/2.1.2/uniref90/uniref90.fasta \
--mgnify_database_path=$DATABASES_DIR/alphafold/2.1.2/mgnify/mgy_clusters_2018_12.fa \
--template_mmcif_dir=$DATABASES_DIR/alphafold/2.1.2/pdb_mmcif/mmcif_files \
--max_template_date=2020-05-14 \
--obsolete_pdbs_path=$DATABASES_DIR/alphafold/2.1.2/pdb_mmcif/obsolete.dat \
--pdb_seqres_database_path=$ALPHAFOLD_DB/pdb_seqres/pdb_seqres \
--uniprot_database_path=$ALPHAFOLD_DB/uniprot/uniprot.fasta \
--small_bfd_database_path=$DATABASES_DIR/alphafold/2.1.2/small_bfd/bfd-first_non_consensus_sequences.fasta \
--pdb70_database_path=$DATABASES_DIR/alphafold/2.1.2/pdb70/pdb70 \
--fasta_paths=<path to fasta file here> \
--output_dir=<path to output directory>

```
Remember to fill in your fasta path and output dir if you wish to use this template.
