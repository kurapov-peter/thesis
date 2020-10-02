cmake_minimum_required(VERSION 3.10)

project(L0_testing)
add_executable(query_host host.cpp)
target_link_libraries(query_host ze_loader)

configure_file(group_by_query.ll ${CMAKE_BINARY_DIR}/group_by_query.ll COPYONLY)