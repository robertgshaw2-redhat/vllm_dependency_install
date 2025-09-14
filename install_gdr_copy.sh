export PREFIX=${HOME}/.local
export DESTLIB=${HOME}/.local/lib

git clone https://github.com/NVIDIA/gdrcopy.git && \
cd gdrcopy && \
make prefix=${PREFIX} lib_install && \
cp src/libgdrapi.so $DESTLIB
cd .. && rm -rf gdrcopy