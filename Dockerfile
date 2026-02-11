# Use a lightweight Linux image with C++ tools
FROM ubuntu:latest

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Build Tools and OpenGL Dependencies
# We install:
# - build-essential: GCC/G++ compilers
# - cmake: The build system
# - libglfw3-dev: Windowing library
# - libglm-dev: Math library
# - git: version control
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libglfw3-dev \
    libglm-dev \
    xorg-dev \
    libgl1-mesa-dev

# Set the working directory inside the container
WORKDIR /app

# By default, when you run this container, it will try to build your game
CMD ["/bin/bash"]