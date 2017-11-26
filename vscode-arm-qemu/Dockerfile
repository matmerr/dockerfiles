FROM r.j3ss.co/vscode:latest
RUN apt-get update
RUN apt-get install -y sudo \
    gcc-arm-none-eabi \
    gdb-arm-none-eabi \
    qemu-system-arm
RUN usermod -aG sudo user
RUN echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
#USER user
WORKDIR /home/user/workspace
COPY .vscode ../.vscode
COPY setup.sh /init/shell_colors.sh

#ENTRYPOINT sh -c .vscode/terminal/.setup.sh
