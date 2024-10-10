cmake -DCMAKE_BUILD_TYPE=Release \
      -DPYTHON_EXECUTABLE=${PREFIX}/bin/python \
      -DCMAKE_INSTALL_PREFIX=${SRC_DIR}/build/lib.macosx-11.1-arm64-cpython-311/kaldi_native_fbank \
      -DKALDI_NATIVE_FBANK_BUILD_TESTS=ON \
      -DKALDI_NATIVE_FBANK_BUILD_PYTHON=ON \
      -GNinja -B build

cmake --build build

$PYTHON -m pip install . -v --no-deps --no-build-isolation