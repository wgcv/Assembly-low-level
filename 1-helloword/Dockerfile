# Use an official Ubuntu base image
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    nasm \
    gcc \
    make \
    libc6-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Copy the assembly code into the container
COPY hello.asm /workspace/hello.asm

# Assemble and link the assembly code
RUN nasm -f elf64 hello.asm -o hello.o && \
    ld -o hello hello.o

# Command to run the executable
CMD ["./hello"]

# > nasm -felf64 hello.asm -o hello.o
# > ld -o hello hello.o
# > chmod u+x hello


## Build the Docker image
# docker build -t asm-env .
# docker build -f Dockerfile.linux -t asm-env-linux .
## Run the Docker container
# docker run --rm asm-env

