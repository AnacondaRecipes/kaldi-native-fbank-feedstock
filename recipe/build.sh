# we need to call cmake first because the `python -m pip install` step does not build dynamic libraries
# and does not include headers
cmake -DCMAKE_BUILD_TYPE=Release \
      -DPYTHON_EXECUTABLE=${PREFIX}/bin/python \
      -DKALDI_NATIVE_FBANK_BUILD_TESTS=ON \
      -DKALDI_NATIVE_FBANK_BUILD_PYTHON=ON \
      -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      $CMAKE_ARGS \
      -GNinja -B build

cmake --build build --target install

# create python bindings
$PYTHON -m pip install . -v --no-deps --no-build-isolation

# remove duplicated artifacts from callling cmake and then python -m pip install
rm -rf ${SP_DIR}/kaldi_native_fbank/include ${SP_DIR}/kaldi_native_fbank/lib
