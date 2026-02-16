cmake_minimum_required(VERSION 3.10)
project(OpenGLFPS)

# Fix the CMake warning
cmake_policy(SET CMP0072 NEW)

set(CMAKE_CXX_STANDARD 17)

find_package(glfw3 3.3 REQUIRED)
find_package(OpenGL REQUIRED)

# Tell the compiler where to look for header files (glad.h)
include_directories(include)

# Compile main.cpp AND glad.c together
add_executable(OpenGLFPS src/main.cpp src/glad.c)

target_link_libraries(OpenGLFPS glfw OpenGL::GL)