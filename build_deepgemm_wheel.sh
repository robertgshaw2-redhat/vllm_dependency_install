export TORCH_VERION=2.8.0
export DEEPGEMM_URL="https://github.com/deepseek-ai/DeepGEMM"
export WHEELS_DIR=$(pwd)/wheels
export BUILD_VENV=deepgemm_build
export TORCH_CUDA_ARCH_LIST="10.0a+PTX"

git clone "${DEEPGEMM_URL}" deepgemm && \
    cd deepgemm && \
    git submodule update --init --recursive && \
    uv venv ${BUILD_VENV} --python 3.12 && \
    source ${BUILD_VENV}/bin/activate && \
    uv pip install torch==${TORCH_VERION} && \
    uv build --wheel --no-build-isolation --out-dir ${WHEELS_DIR} && \
    cd .. && rm -rf deepgemm