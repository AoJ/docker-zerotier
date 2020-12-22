FROM centos:8

# init process
RUN curl -L https://github.com/nicolas-van/multirun/releases/download/1.0.0/multirun-glibc-1.0.0.tar.gz     \
    | tar -C /bin -zx multirun                                                                              \
    && echo "feac7b8e4d79dae3d19cc4287d80e0b537e71458933c5c752492ac30de8b2fed  /bin/multirun"               \
    | sha256sum --check --status                                                                            \
    && echo 'PS1="[\\e[33;1m\\u@\h \\e[31m\\w\\e[0m]\\$ "' >> /etc/bashrc


COPY install.sh /tmp/
RUN chmod +x /tmp/install.sh && /tmp/install.sh

ENTRYPOINT ["/bin/multirun", "-v"]
