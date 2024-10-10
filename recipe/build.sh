cmake -DCMAKE_BUILD_TYPE=Release \
      -DPYTHON_EXECUTABLE=${PREFIX}/bin/python \
      -DKALDI_NATIVE_FBANK_BUILD_TESTS=ON \
      -DKALDI_NATIVE_FBANK_BUILD_PYTHON=ON \
      -GNinja -B build

cmake --build build

$PYTHON -m pip install . -v --no-deps --no-build-isolation

# adding test files to package
mkdir -p ${SP_DIR}/kaldi_native_fbank/bin
install ${SRC_DIR}/build/bin/test-rfft ${SRC_DIR}/build/bin/test-online-fbank ${SRC_DIR}/build/bin/test-log ${SP_DIR}/kaldi_native_fbank/bin