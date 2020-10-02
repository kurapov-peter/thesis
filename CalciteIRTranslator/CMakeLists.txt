cmake_minimum_required(VERSION 3.10)

# Copy-pasting from llvm-spirv build system

if (NOT DEFINED CALCITE_TRANSLATOR_BUILD_EXTERNAL)
  # check if we build inside llvm or not
  if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    message(STATUS "Calcite translator: External build mode")
    set(CALCITE_TRANSLATOR_BUILD_EXTERNAL YES)
  endif(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
endif (NOT DEFINED CALCITE_TRANSLATOR_BUILD_EXTERNAL)

if(CALCITE_TRANSLATOR_BUILD_EXTERNAL)
  # Note: not tested
  project(CalciteTranslator)
  set(BASE_LLVM_VERSION 12.0.0)

  set(LLVM_TOOLS_COMPONENTS
      llvm-as
      llvm-dis
  )

  find_package(LLVM ${BASE_LLVM_VERSION} REQUIRED
  COMPONENTS
      Analysis
      BitReader
      BitWriter
      Core
      Support
      TransformUtils
      ${LLVM_TOOLS_COMPONENTS}
  )

  set(CMAKE_MODULE_PATH
      ${CMAKE_MODULE_PATH}
      ${LLVM_CMAKE_DIR}
  )

  include(AddLLVM)

  message(STATUS "Found LLVM: ${LLVM_VERSION}")
endif()

set(executable_name CalciteIRTranslator)

set(LLVM_LINK_COMPONENTS
  Analysis
  BitReader
  IRReader
  BitWriter
  Core
  Support
  TransformUtils
)
add_llvm_tool(${executable_name}
  calciteIRTranslator.cpp
  NO_INSTALL_RPATH
)
if (CALCITE_TRANSLATORBUILD_EXTERNAL)
  target_link_libraries(${executable_name} ${llvm_libs})
endif()
