# todo: need to include tools as part of the image
# also need to fix gdb and rossetta issue
# https://sporks.space/2023/04/12/debugging-an-x86-application-in-rosetta-for-linux/
# https://github.com/microsoft/vscode-cpptools/issues/10788#issuecomment-1574068137

# Use an x86_64 base image
FROM --platform=linux/amd64 ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    file \
    curl \
    wget \
    vim \
    git \
    --no-install-recommends

# Set the TERM environment variable
ENV TERM=xterm-256color

# Clone repo into working directory
#RUN git clone https://github.com/pr1or1tyQ/nightmare.git


# Set the working directory
#WORKDIR /nightmare

# run script from repo
#RUN chmod +x /nightmare/linux_vm_install.sh
#RUN ./dev/nightmare/linux_vm_install.sh

# Clean Up Install
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Default command when container is run
#CMD ["bash"]
CMD ["/bin/sh", "-c", "\
    git clone https://github.com/pr1or1tyQ/nightmare.git && \
    cd nightmare && \
    chmod +x ./linux_vm_install.sh && \
    ./linux_vm_install.sh && \
    /bin/bash"]
