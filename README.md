### vLLM Dependency Installation

This repo contains basic scripts for installing various vLLM dependencies.

We install the user space packages to local user without requiring use of sudo. The Kernel Space changes (needed for multi-node) require sudo to load GDRCopy and enable IGBDA.

#### User Space
- source the envs.sh (or add to your bashrc)
- install gdrcopy (note: this just installs the user space stuff. We still need to install the kernel driver if we want to actually use GDRCopy)
- install nvshmem
- build deepep
- build deepgemm

#### Kernel Space
- TODO

#### Notes
- pplx uses GDRCopy for multi-node, so we will need the driver for this
- deepep uses IGBDA for multi-node. so we will need to ensure this is enabled 
