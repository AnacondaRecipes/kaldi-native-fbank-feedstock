# Specify the version of CMake required
cmake_minimum_required(VERSION 3.10)

# Set the package version if necessary
set(kaldi-native-fbank_VERSION 1.0)

# ---- Locate the core library ----
# If the library is installed in a non-standard location, set its path explicitly.
# "CMAKE_CURRENT_LIST_DIR" refers to the directory containing this config file.

# Set the path to the dynamic library (.dylib)
set(kaldi-native-fbank_LIB_PATH "${CMAKE_CURRENT_LIST_DIR}/../../libkaldi-native-fbank-core.$ENV{SHLIB_EXT}")

# Set include paths if necessary (if there are headers to be included, this can point to an include directory)
# For this example, assume there are no headers. Add if necessary.
set(kaldi-native-fbank_INCLUDE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../include")

# Provide a target for the core library
if(NOT TARGET kaldi-native-fbank::core)
    add_library(kaldi-native-fbank::core SHARED IMPORTED)
    set_target_properties(kaldi-native-fbank::core PROPERTIES
        IMPORTED_LOCATION "${kaldi-native-fbank_LIB_PATH}"
    )
endif()

# ---- Optionally configure the Python bindings ----
# This is optional and depends on how Python is intended to be used with this package.
# You can set the Python package path or provide variables for further configuration.

# Set the path to the Python bindings (if relevant)
set(kaldi-native-fbank_PYTHON_PACKAGE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../python$ENV{PY_VER}/site-packages/kaldi_native_fbank")

# Provide a variable that external CMake projects can use to locate the Python package
set(kaldi-native-fbank_PYTHON_PACKAGE_HINTS "${kaldi-native-fbank_PYTHON_PACKAGE_DIR}")

# ---- Export variables for package consumers ----
# Export include directories and library to external projects

# Provide the library and include paths as hints for external consumers
set(kaldi-native-fbank_LIBRARIES kaldi-native-fbank::core)

# Optionally set the include directories if there are headers
# set(kaldi-native-fbank_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/include")

# Export all necessary variables
set(kaldi-native-fbank_FOUND TRUE)