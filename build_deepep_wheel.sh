export TORCH_VERION=2.8.0
export DEEPEP_URL="https://github.com/deepseek-ai/DeepEP"
export WHEELS_DIR=$(pwd)/wheels
export BUILD_VENV=deepep_build
export TORCH_CUDA_ARCH_LIST="9.0 10.0a+PTX"

git clone "${DEEPEP_URL}" deepep && \
    cd deepep && \
    uv venv ${BUILD_VENV} --python 3.12 && \
    source ${BUILD_VENV}/bin/activate && \
    uv pip install torch==${TORCH_VERION} numpy ninja && \
    uv build --wheel --no-build-isolation --out-dir ${WHEELS_DIR} && \
    cd .. && rm -rf deepep