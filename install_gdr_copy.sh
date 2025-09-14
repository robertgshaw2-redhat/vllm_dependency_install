git clone https://github.com/NVIDIA/gdrcopy.git && \
    cd gdrcopy && \
    make prefix=${GDRCOPY_HOME} lib_install && \
    cd .. && rm -rf gdrcopy