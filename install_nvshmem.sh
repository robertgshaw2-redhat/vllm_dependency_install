set -o xtrace

export NVSHMEM_VERSION=3.3.20
export NVSHMEM_DIR=${HOME}/.local/nvshmem-${NVSHMEM_VERSION}
export CUDA_MAJOR=12
export CUDA_ARCH_LIST="90a;100"
export BUILD_VENV=nvshmem_build

# disable all features except IBGDA
export NVSHMEM_IBGDA_SUPPORT=1

export NVSHMEM_SHMEM_SUPPORT=0
export NVSHMEM_UCX_SUPPORT=0
export NVSHMEM_USE_NCCL=0
export NVSHMEM_PMIX_SUPPORT=0
export NVSHMEM_TIMEOUT_DEVICE_POLLING=0
export NVSHMEM_USE_GDRCOPY=0
export NVSHMEM_IBRC_SUPPORT=0
export NVSHMEM_BUILD_TESTS=0
export NVSHMEM_BUILD_EXAMPLES=0
export NVSHMEM_MPI_SUPPORT=0
export NVSHMEM_BUILD_HYDRA_LAUNCHER=0
export NVSHMEM_BUILD_TXZ_PACKAGE=0
export NVSHMEM_TIMEOUT_DEVICE_POLLING=0


wget https://developer.download.nvidia.com/compute/redist/nvshmem/${NVSHMEM_VERSION}/source/nvshmem_src_cuda12-all-all-${NVSHMEM_VERSION}.tar.gz -O nvshmem_src_cuda${CUDA_MAJOR}.tar.gz && \
    tar -xf nvshmem_src_cuda${CUDA_MAJOR}.tar.gz && \
    cd nvshmem_src && \
    uv venv ${BUILD_VENV} --python 3.12 && \
    source ${BUILD_VENV}/bin/activate && \
    uv pip install ninja && \
    rm -rf build && \
    mkdir build && \
        cd build && \
        cmake \
        -G Ninja \
        -DNVSHMEM_PREFIX=${NVSHMEM_DIR} \
        -DCMAKE_CUDA_ARCHITECTURES=${CUDA_ARCH_LIST} \
        .. && \
        ninja -j$(nproc) && \
        ninja install && \
    cd ../.. && rm -rf nvshmem_src nvshmem_src_cuda${CUDA_MAJOR}.tar.gz