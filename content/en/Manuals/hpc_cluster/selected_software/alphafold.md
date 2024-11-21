---
linkTitle: AlphaFold
title: AlphaFold Usage on HPCC
type: docs
weight: 1
---

## AlphaFold3

### Loading the module

You can load AlphaFold3 using the following commands:
```bash
module load alphafold/3
singularity shell $ALPHAFOLD_SING
```
You can also run AlphaFold3 with a gpu. If you wish to use a GPU, [log into an A100 gpu node](https://hpcc.ucr.edu/manuals/hpc_cluster/jobs/#gpu-jobs) and then use the following commands:
```bash
module load alphafold/3
singularity shell --nv $ALPHAFOLD_SING
```

### Using AlphaFold databases

A handful of databases are available at `$ALPHAFOLD_DB` (available after loading the `alphafold/3` module).

An example command is as follows:
```bash
module load alphafold/3
singularity shell --nv $ALPHAFOLD_SING
# Commands from here on are run inside of the Alphafold container
python3 /app/alphafold/run_alphafold.py \
--model_dir=$ALPHAFOLD_DB/model \
--db_dir=$ALPHAFOLD_DB \
--json_path=fold_input.json \
--output_dir=my_output_folder/
```

More information on using Alphafold3 can be found in the [Alphafold3 GitHub repo](https://github.com/google-deepmind/alphafold3), including [input documentation](https://github.com/google-deepmind/alphafold3/blob/main/docs/input.md) and [output documentation](https://github.com/google-deepmind/alphafold3/blob/main/docs/output.md).


## AlphaFold2 
Description of AlphaFold2

### Loading the module

You can load AlphaFold2 using the following commands:
```bash
module load alphafold/2
singularity shell $ALPHAFOLD_SING
```
You can also run AlphaFold2 with a gpu. If you wish to use a GPU, [log into a P100 gpu node](https://hpcc.ucr.edu/manuals/hpc_cluster/jobs/#gpu-jobs) and then use the following commands:
```bash
module load alphafold/2
singularity shell --nv $ALPHAFOLD_SING
```

### Using Alphafold Databases

When running the alphafold command, you will be asked for certain databases. These databases can be found under the path $DATABASE_DIR/alphafold/<version>. They can also be accessed using the `$$ALPHAFOLD_DB` environment variable that is automatically set after loading the alphafold module.

Here is an example of how to write your alphafold command using the monomer preset:
```bash
python3 /app/alphafold/run_alphafold.py \
--model_preset=monomer \
--db_preset=reduced_dbs \
--use_gpu_relax=True \
--data_dir=$ALPHAFOLD_DB \
--uniref90_database_path=$ALPHAFOLD_DB/uniref90/uniref90.fasta \
--mgnify_database_path=$ALPHAFOLD_DB/mgnify/mgy_clusters_2018_12.fa \
--template_mmcif_dir=$ALPHAFOLD_DB/pdb_mmcif/mmcif_files \
--max_template_date=2020-05-14 \
--obsolete_pdbs_path=$ALPHAFOLD_DB/pdb_mmcif/obsolete.dat \
--pdb_seqres_database_path=$ALPHAFOLD_DB/pdb_seqres/pdb_seqres \
--uniprot_database_path=$ALPHAFOLD_DB/uniprot/uniprot.fasta \
--small_bfd_database_path=$ALPHAFOLD_DB/small_bfd/bfd-first_non_consensus_sequences.fasta \
--pdb70_database_path=$ALPHAFOLD_DB/pdb70/pdb70 \
--fasta_paths=<path to fasta file here> \
--output_dir=<path to output directory>
```

and an example using the multimer preset:
```bash
python3 /app/alphafold/run_alphafold.py \
--model_preset=multimer \
--db_preset=reduced_dbs \
--use_gpu_relax=True \
--data_dir=$ALPHAFOLD_DB \
--uniref90_database_path=$ALPHAFOLD_DB/uniref90/uniref90.fasta \
--mgnify_database_path=$ALPHAFOLD_DB/mgnify/mgy_clusters_2018_12.fa \
--template_mmcif_dir=$ALPHAFOLD_DB/pdb_mmcif/mmcif_files \
--max_template_date=2020-05-14 \
--obsolete_pdbs_path=$ALPHAFOLD_DB/pdb_mmcif/obsolete.dat \
--small_bfd_database_path=$ALPHAFOLD_DB/small_bfd/bfd-first_non_consensus_sequences.fasta \
--uniprot_database_path=$ALPHAFOLD_DB/uniprot/uniprot.fasta \
--pdb_seqres_database_path=$ALPHAFOLD_DB/pdb_seqres \
--fasta_paths=<path to fasta file> \
--output_dir=<path to output directory>
```

Remember to fill in your fasta path and output dir if you wish to use these templates.

Additionally, these are not the only two methods of running AlphaFold, and different modes might require different sets of arguments to be passed to `alphafold.py`. For more details regarding what parameters are available, as well as more examples, please refer to the [Alphafold Github Repo](https://github.com/deepmind/alphafold).
