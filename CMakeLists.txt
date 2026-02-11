cmake_minimum_required(VERSION 3.10)
project(OpenGLFPS)

# Use C++ 17 standard
set(CMAKE_CXX_STANDARD 17)

# Find necessary packages (Pre-installed in our Docker container)
find_package(glfw3 3.3 REQUIRED)
find_package(OpenGL REQUIRED)

# Add our source code
add_executable(OpenGLFPS src/main.cpp)

# Link the libraries to our executable
target_link_libraries(OpenGLFPS glfw OpenGL::GL)