set(FLAGS_SSE   "-msse")
set(FLAGS_SSE2  "-msse2")
set(FLAGS_SSE3  "-msse3")
set(FLAGS_SSSE3 "-mssse3")
set(FLAGS_SSE41 "-msse4.1")
set(FLAGS_SSE42 "-msse4.2")
set(FLAGS_AVX   "-mavx;${FLAGS_SSE42}")
set(FLAGS_AVX2  "-mavx2;-mfma;-mf16c;-mlzcnt;-mbmi;-mbmi2;${FLAGS_AVX}")
set(FLAGS_AVX512 "-mavx512f;-mavx512pf;-mavx512er;-mavx512cd;${FLAGS_AVX2}")
set(FLAGS_NATIVE "-march=native")

if ((VC OR BUILD_VC) AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS 5)
  add_compile_options(-fabi-version=6)
endif()

if (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER 5)
  set(FLAGS_KNL "-march=knl")
endif()

if (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER 6)
  set(FLAGS_AVX512 "-march=skylake-avx512")
endif()

if (APPLE)
  list(APPEND CMAKE_SHARED_LINKER_FLAGS -dynamiclib)
endif()