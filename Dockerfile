# Docker image containing generic tools for development, based on Debian testing.

FROM debian:testing-20230612

# Basic build/development tools
RUN apt-get update --quiet --yes && apt-get install --quiet --yes curl git man-db vim wget

# Install Git LFS
RUN wget https://github.com/git-lfs/git-lfs/releases/download/v1.5.5/git-lfs-linux-amd64-1.5.5.tar.gz
RUN tar zxfv git-lfs-linux-amd64-1.5.5.tar.gz
RUN cd git-lfs-1.5.5; ./install.sh; git lfs install; cd ..
RUN rm -rf git-lfs-1.5.5 git-lfs-linux-amd64-1.5.5.tar.gz

# Copy bashrc file
COPY .bashrc root/
