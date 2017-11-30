FROM r.j3ss.co/vscode:latest
RUN echo "deb  http://deb.debian.org/debian jessie contrib main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y sudo \
    wget \
    xterm \
    vim \
    dirmngr \
    clang-format \
    gcc-arm-none-eabi \
    gdb-arm-none-eabi 
RUN echo "deb http://archive.ubuntu.com/ubuntu xenial main universe restricted multiverse" >> /etc/apt/sources.list
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 40976EAF437D05B5
RUN apt-get update && apt-get install -y qemu-system-arm=1:2.5+dfsg-5ubuntu10 
RUN usermod -aG sudo user
RUN echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
WORKDIR /home/user/workspace
COPY .vscode ../.vscode
COPY setup.sh ../shell_colors.sh
