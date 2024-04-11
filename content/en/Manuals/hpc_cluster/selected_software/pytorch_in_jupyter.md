---
linkTitle: "PyTorch In Jupyter"
title: "PyTorch In Jupyter"
type: docs
weight: 1
---

## PyTorch in a Jupyter Notebook

There are many ways to run PyTorch within Jupyter, though some methods are needlessly complicated or are more prone to errors. If you intend to use PyTorch within Jupyter, the following steps should get you up and running.


## Setting Up The Environment

Creating a new Conda environment is necessary as we do not provide PyTorch through our global Python installation.

```bash
conda create -n pytorch_env
conda activate pytorch_env
```

After activating the conda environment, install python and ipykernel.

> Warning: The [PyTorch instructions](https://pytorch.org/get-started/locally/) provide a method of installing through Conda. **Do not use this method** as the CUDA packages installed through Conda can conflict with the system installation.

```bash
conda install python=3 ipykernel
```

> At this point run `which pip`, it should return a path ending in something similar to `...../.conda/envs/pytorch_env/bin/pip`. If the output path begins with `/opt/linux/...` then the environment has not been set up correctly.

With `ipykernel` installed, add the environment as a Jupyter Kernel.

```bash
python -m ipykernel install --user --name pytorch_env --display-name "PyTorch Env"
```

> For more info on Jupyter Kernels, see the [Package Management](https://hpcc.ucr.edu/manuals/hpc_cluster/package_manage/#virtual-environment) page.

PyTorch can now be installed in the Conda environment using Pip

```bash
pip3 install torch torchvision torchaudio
```

From this point, the PyTorch kernel should be ready to use within Jupyter. Because of it's requirement for a GPU, it will need to be run using OnDemand or through an interactive session.

## Running on Jupyter

The below steps will focus on running it through OnDemand.

From within OnDemand, start a new Jupyter Notebook using the highlighted options below. 

![pytorch jupyter](/img/pytorch_jupyter.png)

Once the session has started, be sure to use the "PyTorch Env" kernel that we created earlier when creating a new notebook or within existing notebooks.

The following code can be used to verify that the GPU is properly working.

```Python
import torch
dev = torch.device("cuda") if torch.cuda.is_available() else torch.device("cpu")
print(dev)
```

If the output prints "cuda", then you're good to go. If it prints "cpu", then please double check that all of the above steps are correct.

![pytorch jupyter](/img/pytorch_jupyter2.png)
