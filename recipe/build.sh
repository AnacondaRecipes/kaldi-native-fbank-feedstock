cmake -DCMAKE_BUILD_TYPE=Release \
      -DPYTHON_EXECUTABLE=${PREFIX}/bin/python \
      -DKALDI_NATIVE_FBANK_BUILD_TESTS=ON \
      -DKALDI_NATIVE_FBANK_BUILD_PYTHON=ON \
      -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      $CMAKE_ARGS \
      -GNinja -B build

cmake --build build --target install

# running tests automatically
$SRC_DIR/build/bin/test-log
$SRC_DIR/build/bin/test-rfft
