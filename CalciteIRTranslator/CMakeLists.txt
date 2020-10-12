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

# enable vc-intrincics, FIXME
if (NOT DEFINED LLVMGenXIntrinsics_SOURCE_DIR)
  message(STATUS "vc-intrinsics are missing. Will try to download them from github.com")

  include(FetchContent)
  FetchContent_Declare(vc-intrinsics
    GIT_REPOSITORY https://github.com/intel/vc-intrinsics.git
    GIT_TAG        91f3df2cd87a7b9706df32046c34fe8d07ecf854
  )
  FetchContent_MakeAvailable(vc-intrinsics)
  FetchContent_GetProperties(vc-intrinsics)

  set(LLVMGenXIntrinsics_SOURCE_DIR ${vc-intrinsics_SOURCE_DIR})
  set(LLVMGenXIntrinsics_BINARY_DIR ${vc-intrinsics_BINARY_DIR})
else()
  # -DLLVMGenXIntrinsics_SOURCE_DIR is provided
  message(STATUS "vc-intrinsics are added manually ${LLVMGenXIntrinsics_SOURCE_DIR}")

  set(LLVMGenXIntrinsics_BINARY_DIR ${CMAKE_BINARY_DIR}/vc-intrinsics-build)
  add_subdirectory(${LLVMGenXIntrinsics_SOURCE_DIR} ${LLVMGenXIntrinsics_BINARY_DIR})
endif()

target_include_directories(LLVMGenXIntrinsics
  PUBLIC $<BUILD_INTERFACE:${LLVMGenXIntrinsics_SOURCE_DIR}/GenXIntrinsics/include>
  PUBLIC $<BUILD_INTERFACE:${LLVMGenXIntrinsics_BINARY_DIR}/GenXIntrinsics/include>
)

#set_property(GLOBAL PROPERTY LLVMGenXIntrinsics_SOURCE_PROP ${LLVMGenXIntrinsics_SOURCE_DIR})
#set_property(GLOBAL PROPERTY LLVMGenXIntrinsics_BINARY_PROP ${LLVMGenXIntrinsics_BINARY_DIR})

message(STATUS "vc-intrincics src dir is ${LLVMGenXIntrinsics_SOURCE_DIR}")
message(STATUS "vc-intrincics bin dir is ${LLVMGenXIntrinsics_BINARY_DIR}")

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

  ADDITIONAL_HEADER_DIRS
  ${LLVM_MAIN_SRC_DIR}/projects/vc-intrinsics/GenXIntrinsics/include
  ${LLVM_BINARY_DIR}/projects/vc-intrinsics/GenXIntrinsics/include
#  ${LLVMGenXIntrinsics_BINARY_DIR}/GenXIntrinsics/include

  DEPENDS
  LLVMGenXIntrinsics
)
if (CALCITE_TRANSLATORBUILD_EXTERNAL)
  target_link_libraries(${executable_name} PRIVATE ${llvm_libs} LLVMGenXIntrinsics)
endif()

target_link_libraries(${executable_name} PRIVATE LLVMGenXIntrinsics)

# FIXME
target_include_directories(${executable_name}
  PRIVATE ${LLVM_MAIN_SRC_DIR}/projects/vc-intrinsics/GenXIntrinsics/include)
target_include_directories(${executable_name}
  PRIVATE ${LLVM_BINARY_DIR}/projects/vc-intrinsics/GenXIntrinsics/include)

target_include_directories(${executable_name}
  PRIVATE ${LLVMGenXIntrinsics_BINARY_DIR}/GenXIntrinsics/include)
target_include_directories(${executable_name}
  PRIVATE ${LLVMGenXIntrinsics_SOURCE_DIR}/GenXIntrinsics/include)
