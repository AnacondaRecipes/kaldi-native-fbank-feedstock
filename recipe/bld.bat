cmake -DCMAKE_BUILD_TYPE=Release ^
      -DPYTHON_EXECUTABLE=%PREFIX%\bin\python ^
      -DKALDI_NATIVE_FBANK_BUILD_TESTS=ON ^
      -DKALDI_NATIVE_FBANK_BUILD_PYTHON=ON ^
      %CMAKE_ARGS% ^
      -GNinja -B build

cmake --build build

%PYTHON% -m pip install . -v --no-deps --no-build-isolation

# remove duplicated artifacts from callling cmake and then python -m pip install
rmdir /s /q ${SP_DIR}/kaldi_native_fbank/include ${SP_DIR}/kaldi_native_fbank/lib
