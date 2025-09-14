export NVSHMEM_VERSION=3.3.20
export NVSHMEM_DIR=${HOME}/.local/nvshmem-${NVSHMEM_VERSION}
export CUDA_MAJOR=12
export CUDA_ARCH_LIST="90a;100"

wget https://developer.download.nvidia.com/compute/redist/nvshmem/${NVSHMEM_VERSION}/source/nvshmem_src_cuda12-all-all-${NVSHMEM_VERSION}.tar.gz -O nvshmem_src_cuda${CUDA_MAJOR}.tar.gz && \
    tar -xf nvshmem_src_cuda${CUDA_MAJOR}.tar.gz && \
    cd nvshmem_src && \
    rm -rf build && \
    mkdir build && \
        cd build && \
        cmake \
        -G Ninja \
        -DNVSHMEM_PREFIX=${NVSHMEM_DIR} \
        -DCMAKE_CUDA_ARCHITECTURES=${CUDA_ARCH_LIST} \
        -DNVSHMEM_PMIX_SUPPORT=0 \
        -DNVSHMEM_LIBFABRIC_SUPPORT=0 \
        -DNVSHMEM_IBRC_SUPPORT=1 \
        -DNVSHMEM_IBGDA_SUPPORT=1 \
        -DNVSHMEM_IBDEVX_SUPPORT=1 \
        -DNVSHMEM_SHMEM_SUPPORT=0 \
        -DNVSHMEM_USE_GDRCOPY=1 \
        -DNVSHMEM_MPI_SUPPORT=0 \
        -DNVSHMEM_USE_NCCL=0 \
        -DNVSHMEM_BUILD_TESTS=0 \
        -DNVSHMEM_BUILD_EXAMPLES=0 \
        -DGDRCOPY_HOME=${GDRCOPY_HOME} \
        .. && \
        ninja -j$(nproc) && \
        ninja install && \
    cd ../.. && rm -rf nvshmem_src nvshmem_src_cuda${CUDA_MAJOR}.tar.gz