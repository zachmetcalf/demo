################################################################################################################################################################
## CMakeLists.txt
##
## Zach Metcalf
################################################################################################################################################################

cmake_minimum_required(VERSION 3.25)

project(demo LANGUAGES CXX VERSION 1.0)

message("configuring demo workspace...")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(BINARY_DIRECTORY ${CMAKE_SOURCE_DIR}/bin CACHE PATH "binary directory")
set(INSTALL_DIRECTORY ${CMAKE_SOURCE_DIR}/install CACHE PATH "install directory")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${BINARY_DIRECTORY})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${BINARY_DIRECTORY})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${BINARY_DIRECTORY})

set(PROJECT_NAME demo)
set(PROJECT_TARGET ${PROJECT_NAME})

message("configuring project ${PROJECT_NAME}...")

set(HEADER_FILES
)

set(SOURCE_FILES
	demo.cpp
)

add_executable(${PROJECT_TARGET} ${SOURCE_FILES} ${HEADER_FILES})

target_include_directories(${PROJECT_TARGET} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

message("building project ${PROJECT_NAME}...")

set_target_properties(${PROJECT_TARGET} PROPERTIES ARCHIVE_OUTPUT_DIRECTORY ${BINARY_DIRECTORY}/${PROJECT_NAME})
set_target_properties(${PROJECT_TARGET} PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${BINARY_DIRECTORY}/${PROJECT_NAME})
set_target_properties(${PROJECT_TARGET} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${BINARY_DIRECTORY}/${PROJECT_NAME})

message("installing project ${PROJECT_NAME}...")

install(TARGETS ${PROJECT_TARGET} RUNTIME DESTINATION ${INSTALL_DIRECTORY}/${PROJECT_NAME})
