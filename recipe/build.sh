cmake -DCMAKE_BUILD_TYPE=Release \
      -DPYTHON_EXECUTABLE=${PREFIX}/bin/python \
      -DKALDI_NATIVE_FBANK_BUILD_TESTS=ON \
      -DKALDI_NATIVE_FBANK_BUILD_PYTHON=ON \
      -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -GNinja -B build

cmake --build build --target install

$PYTHON -m pip install . -v --no-deps --no-build-isolation
