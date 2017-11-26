FROM r.j3ss.co/vscode:latest
RUN echo "deb  http://deb.debian.org/debian jessie contrib main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y sudo \
    gcc-arm-none-eabi \
    gdb-arm-none-eabi \
    qemu-system-arm=1:2.1+dfsg-12+deb8u6
RUN usermod -aG sudo user
RUN echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
WORKDIR /home/user/workspace
COPY .vscode ../.vscode
COPY setup.sh ../shell_colors.sh