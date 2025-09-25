### vLLM Dependency Installation

This repo contains basic scripts for installing various vLLM dependencies.

We install the user space packages to local user without requiring use of sudo. The Kernel Space changes (needed for multi-node) require sudo to load GDRCopy and enable IGBDA.

#### User Space
- source the envs.sh (or add to your bashrc)
- install nvshmem
- build deepep
- build deepgemm

